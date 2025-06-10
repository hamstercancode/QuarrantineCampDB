<?php
    header('Content-Type: application/json');
    require_once('include/config.php');
    $vid=$_GET['id'];

    $data_pcr = array();


    $query = "SELECT PCR_ct_value, COUNT(PCR_ct_value) AS size_pcr FROM PATIENT_TEST_RESULTS WHERE Patient_no = '$vid' GROUP BY PCR_ct_value";
    $stmt = $conn->prepare($query);
    if($stmt->execute()){
        if($stmt->rowCount()>0){
            $result = $stmt->fetchAll(PDO::FETCH_ASSOC);
        }
    }
    foreach($result as $row){
        $data_pcr[] = $row;
    }
    echo json_encode($data_pcr);
?>