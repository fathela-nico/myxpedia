$(document).ready(function () {
    const countrymodal = $('#countrydetailmodal'),
        addnewcountrybutton = $('#addnewcountry'),
        countryidfield = $("#countryid"),
        countrynamefield = $("#countryname"),
        savecountrybutton = $("#savecountry"),
        notifications = $("#notifications");

    addnewcountrybutton.on("click", function () {
        countrymodal.modal("show");
    });

    savecountrybutton.on("click", function () {
        const countryname = countrynamefield.val().trim(),
            countryid = countryidfield.val();

        if (countryname === "") {
            notifications.html("<div class='alert alert-primary'>Please enter country name</div>");
            countrynamefield.focus();
        } else {
            $.post(
                "controllers/countryoperations.php",
                {
                    savecountry: true,
                    countryid: countryid,
                    countryname: countryname
                },
                function (data) {
                    if (isJson(data)) {
                        data = JSON.parse(data);

                        if (data.status === "success") {
                            notifications.html("<div class='alert alert-success'>Country has been saved successfully</div>");
                            countrynamefield.val("");
                            countrynamefield.focus();
                        } else if (data.status === "exists") {
                            notifications.html("<div class='alert alert-info'>Country name already exists</div>");
                            countrynamefield.focus();
                        } else if (data.status === "blank") {
   
                        }
                         else {
                            notifications.html("<div class='alert alert-warning'>Unexpected response</div>");
                        }
                    } else {
                        notifications.html(`<div class='alert alert-danger'>Sorry, an error occurred: ${data}</div>`);
                        countrynamefield.focus();
                    }
                }
            ).fail(function (xhr, status, error) {
                notifications.html(`<div class='alert alert-danger'>Request failed: ${error}</div>`);
            });
        }
    });

    countrynamefield.on("input", function () {
        notifications.html("");
    });

    function isJson(str) {
        try {
            JSON.parse(str);
            return true;
        } catch (e) {
            return false;
        }
    }
});
