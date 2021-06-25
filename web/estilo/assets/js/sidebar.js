$(document).ready(
        function () {
            $('#sidebarCollapse').on('click', function () {
                   console.log("ereedsdsdd");
                $('#sidebar').toggleClass('active');
                $('#content').toggleClass('active');
            });
        }
);