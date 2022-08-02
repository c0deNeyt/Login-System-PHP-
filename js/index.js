
$(function(){
    $( "#datepicker" ).datepicker({
        showButtonPanel: true
    });
});

$("div.wrapper").hover(function () {
    if(('div.successMsg').length){
        $(".successMsg").fadeOut(2000, function(){ $(this).remove();});
    };

});

async function alert() {
    const Toast = Swal.mixin({
        toast: true,
        position: 'top-right',
        iconColor: 'white',
        customClass: {
            popup: 'colored-toast'
        },
        showConfirmButton: false,
        timer: 2000,
        timerProgressBar: true
    })
    await Toast.fire({
        icon: 'success',
        title: 'Password reset success!'
    }).then(function() {
        window.location.href = "index.php";
    });
};
$("a.resetPass").click(function () {
    Swal.fire({
        title: 'Please provide your phone number',
        html: `<input type="text" name="phoneNumber" id="phoneNumber" class="customInput" placeholder="Phone Number">`,
        confirmButtonText: 'Submit!',
        focusConfirm: false,
        preConfirm: () => {
            return new Promise(function (resolve) {
                const cn = Swal.getPopup().querySelector('#phoneNumber').value;
                var cdNo = $.trim(cn);
                $.ajax({
                    type: 'POST',
                    url: 'php/process.php',
                    data: {phoneNumber: cdNo, request: 1},
                    dataType: 'json',
                    success: function (response) {
                        if(response == true){
                            alert();
                        }else{
                            Swal.showValidationMessage(`Can't find contact number!`);
                        }
                    },
                    error: function () {
                        // ERROR HANDLING
                        Swal.showValidationMessage(`Something went wrong!`);
                    }
                });
                setTimeout(function () {
                    resolve();
                }, 250);
            });
        }
    });
});


