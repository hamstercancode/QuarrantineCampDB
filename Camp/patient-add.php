<?php
session_start();
error_reporting(0);
include('include/config.php');
include('include/checklogin.php');
check_login();

ini_set('display_errors', 1);
error_reporting(E_ALL);



if(isset($_POST['submit']))
{	
$pat_no='PAT';

if ($result=mysqli_query($con,"SELECT Patient_no FROM patient"))
{
    $rowcount=mysqli_num_rows($result) + 1;
    if($rowcount < 100)
    {
        $pat_no = $pat_no . "0" . $rowcount;
    }
    else
    {
        $pat_no = $pat_no . $rowcount;
    }
     mysqli_free_result($result);
}

$pat_name=$_POST['pat_name'];
$pat_ID=$_POST['pat_ID'];
$pat_phone=$_POST['pat_phone'];
$pat_gender=$_POST['pat_gender'];
$pat_address=$_POST['pat_address'];
$pat_discharge_date=$_POST['pat_discharge_date'];
$nur_ID=$_POST['nur_ID'];
$pat_admission_date=$_POST['pat_admission_date'];
$loc_before=$_POST['loc_before'];
$sta_ID=$_POST['sta_ID'];


$sql= "INSERT INTO `patient` (`Patient_no`, `Patient_name`, `ID_no`, `Phone_no`, `Gender`, `Patient_address`, `Discharge_date`, `Nurse_ID`, `Admission_date`, `Location_before`, `Staff_ID`) VALUES('$pat_no','$pat_name','$pat_ID','$pat_phone','$pat_gender','$pat_address','$pat_discharge_date','$nur_ID', '$pat_admission_date', '$loc_before', '$sta_ID')";
$result = mysqli_query($con, $sql) or die(mysqli_error($con));

if ($result) {
     echo "<script>alert('Patient info added successfully');</script>";
    echo "<script>window.location.href ='patient-list.php'</script>";

}

}
?>


<!DOCTYPE html>
<html lang="en">

<head>
    <title>Manager | Add Patient</title>

    <link
        href="http://fonts.googleapis.com/css?family=Lato:300,400,400italic,600,700|Raleway:300,400,500,600,700|Crete+Round:400italic"
        rel="stylesheet" type="text/css" />
    <link rel="stylesheet" href="vendor/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="vendor/fontawesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="vendor/themify-icons/themify-icons.min.css">
    <link href="vendor/animate.css/animate.min.css" rel="stylesheet" media="screen">
    <link href="vendor/perfect-scrollbar/perfect-scrollbar.min.css" rel="stylesheet" media="screen">
    <link href="vendor/switchery/switchery.min.css" rel="stylesheet" media="screen">
    <link href="vendor/bootstrap-touchspin/jquery.bootstrap-touchspin.min.css" rel="stylesheet" media="screen">
    <link href="vendor/select2/select2.min.css" rel="stylesheet" media="screen">
    <link href="vendor/bootstrap-datepicker/bootstrap-datepicker3.standalone.min.css" rel="stylesheet" media="screen">
    <link href="vendor/bootstrap-timepicker/bootstrap-timepicker.min.css" rel="stylesheet" media="screen">
    <link rel="stylesheet" href="assets/css/styles.css">
    <link rel="stylesheet" href="assets/css/plugins.css">
    <link rel="stylesheet" href="assets/css/themes/theme-1.css" id="skin_color" />
    <script type="text/javascript">
        function valid() {
            if (document.adddoc.npass.value != document.adddoc.cfpass.value) {
                alert("Password and Confirm Password Field do not match  !!");
                document.adddoc.cfpass.focus();
                return false;
            }
            return true;
        }
    </script>


    <script>
        function checkemailAvailability() {
            $("#loaderIcon").show();
            jQuery.ajax({
                url: "check_availability.php",
                data: 'emailid=' + $("#docemail").val(),
                type: "POST",
                success: function (data) {
                    $("#email-availability-status").html(data);
                    $("#loaderIcon").hide();
                },
                error: function () {}
            });
        }
    </script>
</head>

<body>
    <div id="app">
        <?php include('include/sidebar.php');?>
        <div class="app-content">

            <?php include('include/header.php');?>

            <!-- end: TOP NAVBAR -->
            <div class="main-content">
                <div class="wrap-content container" id="container">
                    <!-- start: PAGE TITLE -->
                    <section id="page-title">
                        <div class="row">
                            <div class="col-sm-8">
                                <h1 class="mainTitle">Manager | Add Patient</h1>
                            </div>
                            <ol class="breadcrumb">
                                <li>
                                    <span>Manager</span>
                                </li>
                                <li class="active">
                                    <span>Add Patient</span>
                                </li>
                            </ol>
                        </div>
                    </section>
                    <!-- end: PAGE TITLE -->
                    <!-- start: BASIC EXAMPLE -->
                    <div class="container-fluid container-fullw bg-white">
                        <div class="row">
                            <div class="col-md-12">

                                <div class="row margin-top-30">
                                    <div class="col-lg-8 col-md-12">
                                        <div class="panel panel-white">
                                            <div class="panel-heading">
                                                <h5 class="panel-title">Add Patient</h5>
                                            </div>
                                            <div class="panel-body">

                                                <form role="form" name="addpat" method="post"
                                                    onSubmit="return valid();">


                                                    <div class="form-group">
                                                        <label for="name">
                                                            Patient Name
                                                        </label>
                                                        <input type="text" name="pat_name" class="form-control"
                                                            placeholder="Enter Patient Name, e.g. Pet" required="true">
                                                    </div>


                                                    <div class="form-group">
                                                        <label for="ID">
                                                            Patient ID
                                                        </label>
                                                        <input type="text" name="pat_ID" class="form-control"
                                                            placeholder="Enter Patient ID, e.g. 1234" required="true">
                                                    </div>

                                                    <div class="form-group">
                                                        <label for="Phone">
                                                            Patient Phone
                                                        </label>
                                                        <input type="text" name="pat_phone" class="form-control"
                                                            placeholder="Enter Patient Phone, e.g. 1234" required="true">
                                                    </div>

                                                    <div class="form-group">
                                                        <label for="Gender">
                                                            Patient Gender
                                                        </label>
                                                        <input type="text" name="pat_gender" class="form-control"
                                                            placeholder="Enter Patient Gender, e.g. M" required="true">
                                                    </div>

                                                     <div class="form-group">
                                                        <label for="Address">
                                                            Patient Address
                                                        </label>
                                                        <input type="text" name="pat_address" class="form-control"
                                                            placeholder="Enter Patient Address, e.g. 268 Ly Thuong Kiet Str" required="true">
                                                    </div>

                                                     <div class="form-group">
                                                        <label for="Admission">
                                                            Admission Date
                                                        </label>
                                                        <input type="date" name="pat_admission_date" class="form-control"
                                                            placeholder="e.g. 2021-12-25" required="true">
                                                    </div>

                                                     <div class="form-group">
                                                        <label for="Discharge">
                                                            Discharge Date
                                                        </label>
                                                        <input type="date" name="pat_discharge_date" class="form-control"
                                                            placeholder="e.g. 2021-12-25" required="true">
                                                    </div>

                                                    

                                                     <div class="form-group">
                                                        <label for="Location">
                                                            Location Before
                                                        </label>
                                                        <input type="text" name="loc_before" class="form-control"
                                                            placeholder="e.g. HCMUT" required="true">
                                                    </div>

                                                    <div class="form-group">
                                                        <label for="Staff">
                                                            Staff ID
                                                        </label>
                                                        <input type="text" name="sta_ID" class="form-control"
                                                            placeholder="e.g. STA000" required="true">
                                                    </div>

                                                    <div class="form-group">
                                                        <label for="Nurse">
                                                            Nurse ID
                                                        </label>
                                                        <input type="text" name="nur_ID" class="form-control"
                                                            placeholder="e.g. NUR000" required="true">
                                                    </div>

                                                    <button type="submit" name="submit" id="submit"
                                                        class="btn btn-o btn-primary">
                                                        Submit
                                                    </button>
                                                </form>
                                            </div>
                                        </div>
                                    </div>

                                </div>
                            </div>
                            <div class="col-lg-12 col-md-12">
                                <div class="panel panel-white">


                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- end: BASIC EXAMPLE -->






            <!-- end: SELECT BOXES -->

        </div>
    </div>
    </div>
	<!-- start: FOOTER -->
	<?php include('include/footer.php');?>
    <!-- end: FOOTER -->

    <!-- start: SETTINGS -->
    <?php include('include/setting.php');?>

    <!-- end: SETTINGS -->
    </div>
    <!-- start: MAIN JAVASCRIPTS -->
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.min.js"></script>
    <script src="vendor/modernizr/modernizr.js"></script>
    <script src="vendor/jquery-cookie/jquery.cookie.js"></script>
    <script src="vendor/perfect-scrollbar/perfect-scrollbar.min.js"></script>
    <script src="vendor/switchery/switchery.min.js"></script>
    <!-- end: MAIN JAVASCRIPTS -->
    <!-- start: JAVASCRIPTS REQUIRED FOR THIS PAGE ONLY -->
    <script src="vendor/maskedinput/jquery.maskedinput.min.js"></script>
    <script src="vendor/bootstrap-touchspin/jquery.bootstrap-touchspin.min.js"></script>
    <script src="vendor/autosize/autosize.min.js"></script>
    <script src="vendor/selectFx/classie.js"></script>
    <script src="vendor/selectFx/selectFx.js"></script>
    <script src="vendor/select2/select2.min.js"></script>
    <script src="vendor/bootstrap-datepicker/bootstrap-datepicker.min.js"></script>
    <script src="vendor/bootstrap-timepicker/bootstrap-timepicker.min.js"></script>
    <!-- end: JAVASCRIPTS REQUIRED FOR THIS PAGE ONLY -->
    <!-- start: CLIP-TWO JAVASCRIPTS -->
    <script src="assets/js/main.js"></script>
    <!-- start: JavaScript Event Handlers for this page -->
    <script src="assets/js/form-elements.js"></script>
    <script>
        jQuery(document).ready(function () {
            Main.init();
            FormElements.init();
        });
    </script>
    <!-- end: JavaScript Event Handlers for this page -->
    <!-- end: CLIP-TWO JAVASCRIPTS -->
</body>

</html>