<?php
session_start();
error_reporting(0);
include('include/config.php');
include('include/checklogin.php');
check_login();


?>
<!DOCTYPE html>
<html lang="en">
<style type="text/css">
#chart-container {
	margin:0 auto;
    width: 30%;
}
</style>

	<script type="text/javascript" src="js/chart.js"></script>
	<script type="text/javascript" src="js/chart.min.js"></script>
	<script src="js/canvasjs.min.js"></script>
	<head>
		<title>Manager | Manage Patients</title>
		
		<link href="http://fonts.googleapis.com/css?family=Lato:300,400,400italic,600,700|Raleway:300,400,500,600,700|Crete+Round:400italic" rel="stylesheet" type="text/css" />
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
	</head>
	<body>
		<div id="app">		
<?php include('include/sidebar.php');?>
<div class="app-content">
<?php include('include/header.php');?>
<div class="main-content" >
<div class="wrap-content container" id="container">
						<!-- start: PAGE TITLE -->
<section id="page-title">
<div class="row">
<div class="col-sm-8">
<h1 class="mainTitle">Manager | Detail Patients</h1>
</div>
<ol class="breadcrumb">
<li>
<span>Manager</span>
</li>
<li class="active">
<span>Detail Patients</span>
</li>
</ol>
</div>
</section>
<div class="container-fluid container-fullw bg-white">
<div class="row">
<div class="col-md-12">
<h5 class="over-title margin-bottom-15">Details <span class="text-bold">Patients</span></h5>
<?php
                               $vid=$_GET['viewid'];
                               $ret=mysqli_query($con,"select * from patient where Patient_no='$vid'");
$cnt=1;
while ($row=mysqli_fetch_array($ret)) {
                               ?>
<table border="1" class="table table-bordered">
 <tr align="center">
<td colspan="4" style="font-size:20px;color:blue"><b>
Medical Record</b></td></tr>

    <tr>
    <th scope>Patient Number</th>
    <td><?php  echo $row['Patient_no'];?></td>
    <th scope>Phone Number</th>
    <td><?php  echo $row['Phone_no'];?></td>
  </tr>
  <tr>
    <th scope>Patient Name</th>
    <td><?php  echo $row['Patient_name'];?></td>
    <th>Admission Date</th>
    <td><?php  echo $row['Admission_date'];?></td>
  </tr>
    <tr>
    <th>Patient ID</th>
    <td><?php  echo $row['ID_no'];?></td>
    <th>Discharge Date</th>
    <td><?php  echo $row['Discharge_date'];?></td>
  </tr>
  <tr>
    <th>Patient Gender</th>
    <td><?php  echo $row['Gender'];?></td>
    <th>Staff ID</th>
    <td><?php  echo $row['Staff_ID'];?></td>
  </tr>

    <tr>
    <th>Patient Address</th>
    <td><?php  echo $row['Patient_address'];?></td>
    <th>Location Before</th>
    <td><?php  echo $row['Location_before'];?></td>
  </tr>
 
<?php }?>
</table>


<?php  
$ret=mysqli_query($con,"select * from PATIENT_TEST_RESULTS  where Patient_no='$vid'");
?>
<table id="datatable" class="table table-bordered dt-responsive nowrap" style="border-collapse: collapse; border-spacing: 10; width: 100%; text-align:center">
  <tr align="center">
   	<th colspan="8" style="text-align:left"  >Medical Testing History</th> 
  </tr>
  <tr>
    <th style="text-align:center">#</th>
<th style="text-align:center">SPO2</th>
<th style="text-align:center">Respiratory Rate</th>
<th style="text-align:center">PCR Test</th>
<th style="text-align:center">PCR CT Value</th>
<th style="text-align:center">Quick Test</th>
<th style="text-align:center">Quick CT Value</th>
<th style="text-align:center">Warning Mark</th>

</tr>
<?php  
while ($row=mysqli_fetch_array($ret)) { 
  ?>
<tr>
    <td><?php echo $cnt;?></td>
    <td><?php  echo $row['SPO2'];?></td>
    <td><?php  echo $row['Respiratory_rate'];?></td>
    <td><?php  echo $row['PCR_test'];?></td>
    <td><?php  echo $row['PCR_ct_value'];?></td> 
    <td><?php  echo $row['Quick_test'];?></td>
    <td><?php  echo $row['Quick_ct_value'];?></td>
    <td><?php  echo $row['Warning_mark'];?></td> 
</tr>
<?php $cnt=$cnt+1;} ?>
</table>
<th align="center">*Note: If the PCR Test (or the Quick Test) is F (False) the two corresponding value columns will be left blank.</th>  
<br>
<br>     
<?php  
$ret=mysqli_query($con,"select * from TREATS  where Patient_no='$vid'");
$cnt=1;
?>
<table id="datatable_2" class="table table-bordered dt-responsive nowrap" style="border-collapse: collapse; border-spacing: 10; width: 100%; text-align:center">
  <tr align="center">
   	<th colspan="8" style="text-align:left"  >Medical Treameant History</th> 
  </tr>
  <tr>
    <th style="text-align:center;">#</th>
<th style="text-align:center">Doctor ID</th>
<th style="text-align:center">Medication Code</th>
<th style="text-align:center">Start Date</th>
<th style="text-align:center">End Date</th>
<th style="text-align:center">Result</th>

</tr>
<?php  
while ($row=mysqli_fetch_array($ret)) { 
  ?>
<tr>
    <td><?php echo $cnt;?></td>
    <td><?php  echo $row['Doctor_ID'];?></td>
    <td><?php  echo $row['Medication_code'];?></td>
    <td><?php  echo $row['Start_date'];?></td>
    <td><?php  echo $row['End_date'];?></td> 
    <td><?php  echo $row['Treat_result'];?></td>
</tr>
<?php $cnt=$cnt+1;} ?>
</table> 

<div id="chart-container">
	<canvas id="graphRes" ></canvas>
	<canvas id="graphPCR"></canvas> 
	<canvas id="graphQuick" ></canvas>
	
</div>

<?php  
$ret=mysqli_query($con,"select * from NORMAL_SYMPTOM where Patient_no='$vid'");
$cnt=1;
?>
<table id="datatable_3" class="table table-bordered dt-responsive nowrap" style="border-collapse: collapse; border-spacing: 10; width: 100%; text-align:center">
  <tr align="center">
   	<th colspan="8" style="text-align:left"  >Normal Symptom List</th> 
  </tr>
  <tr>
    <th style="text-align:center;">#</th>
<th style="text-align:center">Normal Symptom</th>
</tr>
<?php  
while ($row=mysqli_fetch_array($ret)) { 
  ?>
<tr>
    <td><?php echo $cnt;?></td>
    <td><?php  echo $row['Normal_symptoms'];?></td>
</tr>
<?php $cnt=$cnt+1;} ?>
</table> 

<?php  
$ret=mysqli_query($con,"select * from SERIOUS_SYMPTOM where Patient_no='$vid'");
$cnt=1;
?>
<table id="datatable_3" class="table table-bordered dt-responsive nowrap" style="border-collapse: collapse; border-spacing: 10; width: 100%; text-align:center">
  <tr align="center">
   	<th colspan="8" style="text-align:left"  >Serious Symptom List</th> 
  </tr>
  <tr>
    <th style="text-align:center;">#</th>
<th style="text-align:center">Serious Symptom</th>
</tr>
<?php  
while ($row=mysqli_fetch_array($ret)) { 
  ?>
<tr>
    <td><?php echo $cnt;?></td>
    <td><?php  echo $row['Serious_symptoms'];?></td>
</tr>
<?php $cnt=$cnt+1;} ?>
</table> 




</div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
			<!-- start: FOOTER -->
	<?php #include('include/footer.php');?>
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
			jQuery(document).ready(function() {
				Main.init();
				FormElements.init();
			});

			$(document).ready(function () {
            showGraphPCR();
			showGraphQuick();
			showGraphRes();
        });

				function showGraphRes(){
			$.post("data-res.php?id=<?php echo $vid;?>",
			function (datapcr){
				var labels = [];
				var result = [];
				for (var i in datapcr) {
					labels.push(datapcr[i].Respiratory_rate);
					result.push(datapcr[i].size_res);
				}
				var ctx = $("#graphRes");
				var myChart = new Chart(ctx, 
				{
					type: 'line',
					data: {
						labels: labels,
						datasets: [
							{
								label: 'Respiratory rate',
								data: result,
								borderColor: [ 
									'rgba(255, 99, 132, 1)',
									'rgba(54, 162, 235, 1)',
									'rgba(255, 206, 86, 1)',
								],
								backgroundColor: [
												'rgba(75, 192, 192, 0.2)',
                								'rgba(153, 102, 255, 0.2)',
								                'rgba(255, 159, 64, 0.2)'
								],
								borderWidth: 1
							}],
					},
					options: {
						responsive: true,
						plugins: {
							title: {
								display: true,
								text: 'Respiratory rate'
							}
						}
					} 
				});
			});
		}


        function showGraphPCR(){
                $.post("data-pcr.php?id=<?php echo $vid;?>",
                function (datapcr){
                    var labels = [];
                    var result = [];
                    for (var i in datapcr) {
                        labels.push(datapcr[i].PCR_ct_value);
                        result.push(datapcr[i].size_pcr);
                    }
                    var ctx = $("#graphPCR");
                    var myChart = new Chart(ctx, 
					{
                        type: 'pie',
                        data: {
                            labels: labels,
                            datasets: [
                                {
									label: 'PCR CT Value',
                                    data: result,
                                    borderColor: ["rgba(217, 83, 79,1)","rgba(240, 173, 78, 1)","rgba(92, 184, 92, 1)"],
                                    backgroundColor: ["rgba(217, 83, 79,0.2)","rgba(240, 173, 78, 0.2)","rgba(92, 184, 92, 0.2)"],
                                }
                            ]
                        },
                       options: {
							plugins: {
								title: {
									display: true,
									text: 'PCR Test Value'
								}
							}
						} 
                    });
                });
			}

			function showGraphQuick(){
			$.post("data-quick.php?id=<?php echo $vid;?>",
			function (datapcr){
				var labels = [];
				var result = [];
				for (var i in datapcr) {
					labels.push(datapcr[i].Quick_ct_value);
					result.push(datapcr[i].size_quick);
				}
				var ctx = $("#graphQuick");
				var myChart = new Chart(ctx, 
				{
					type: 'radar',
					data: {
						labels: labels,
						datasets: [
							{
								label: 'Quick CT Value',
								data: result,
								borderColor: ["rgba(242,194,165,1))","rgba(240, 173, 78, 1)","rgba(217, 83, 79,1)"],
								backgroundColor: ["rgba(54, 162, 235, 0.2)","rgba(240, 173, 78, 0.2)","rgba(92, 184, 92, 0.2)"],
							}
						]
					},
					options: {
						responsive: true,
						plugins: {
							title: {
								display: true,
								text: 'Quick Test Value'
							}
						}
					} 
				});
			});
		}

		</script>
		<!-- end: JavaScript Event Handlers for this page -->
		<!-- end: CLIP-TWO JAVASCRIPTS -->
	</body>
</html>