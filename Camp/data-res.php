<?php
    header('Content-Type: application/json');
    require_once('include/config.php');
    $vid=$_GET['id'];

    $data = array();


    $query = "SELECT Respiratory_rate, COUNT(Respiratory_rate) AS size_res FROM PATIENT_TEST_RESULTS WHERE Patient_no = '$vid' GROUP BY Respiratory_rate";
    $stmt = $conn->prepare($query);
    if($stmt->execute()){
        if($stmt->rowCount()>0){
            $result = $stmt->fetchAll(PDO::FETCH_ASSOC);
        }
    }
    foreach($result as $row){
        $data[] = $row;
    }
    echo json_encode($data);
?>