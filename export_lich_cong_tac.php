<?php

    // PHPExcel
    include('Classes/PHPExcel.php');
    // connect database
    require_once('../config.php');

    // export file excel
    ob_end_clean();
    $objExcel = new PHPExcel;
    $objExcel->setActiveSheetIndex(0);
    $sheet = $objExcel->getActiveSheet()->setTitle('Lịch công tác');

    // dinh dang file excel
    // - dinh dang cho du kich thuoc noi dung
    $sheet->getColumnDimension("A")->setAutoSize(true);
    $sheet->getColumnDimension("B")->setAutoSize(true);
    $sheet->getColumnDimension("C")->setAutoSize(true);
    $sheet->getColumnDimension("D")->setAutoSize(true);
    $sheet->getColumnDimension("E")->setAutoSize(true);
    $sheet->getColumnDimension("F")->setAutoSize(true);
    $sheet->getColumnDimension("G")->setAutoSize(true);
    $sheet->getColumnDimension("H")->setAutoSize(true);
    $sheet->getColumnDimension("I")->setAutoSize(true);
    // chinh mau dong title
    $sheet->getStyle('A1:I1')->getFill()->setFillType(\PHPExcel_Style_Fill::FILL_SOLID)->getStartColor()->setARGB('00ffff00');
    // canh giua
    $sheet->getStyle('A1:I1')->getAlignment()->setHorizontal(PHPExcel_Style_Alignment::HORIZONTAL_CENTER);

    // dem so dong
    $rowCount = 1;
    // set cho dong dau tien (dong tieu de)
    $sheet->setCellValue('A' . $rowCount, 'STT');
    $sheet->setCellValue('B' . $rowCount, 'Mã nhân viên');
    $sheet->setCellValue('C' . $rowCount, 'Tên nhân viên');
    $sheet->setCellValue('D' . $rowCount, 'Chức vụ');
    $sheet->setCellValue('E' . $rowCount, 'Ngày bắt đầu');
    $sheet->setCellValue('F' . $rowCount, 'Ngày kết thúc');
    $sheet->setCellValue('G' . $rowCount, 'Địa điểm');
    $sheet->setCellValue('H' . $rowCount, 'Mục đích');
    $sheet->setCellValue('I' . $rowCount, 'Trạng thái');

    // show data
    $showData = "SELECT ct.id as id, ma_cong_tac, ma_nv, ten_nv, ten_chuc_vu, ngay_bat_dau, ngay_ket_thuc, dia_diem, muc_dich FROM  nhanvien nv, chuc_vu cv, cong_tac ct WHERE nv.chuc_vu_id = cv.id AND nv.id = ct.nhanvien_id ORDER BY ct.ngay_tao DESC";
    $result = mysqli_query($conn, $showData);
    $stt = 0;
    while ($row = mysqli_fetch_array($result)) {
//        echo "<pre>";
//        var_dump($row); die;
        // do du lieu tang len theo cac cot
        $rowCount++;
        $stt++;
        // do het du lieu ra cac dong
        $sheet->setCellValue('A' . $rowCount, $stt);
        $sheet->setCellValue('B' . $rowCount, $row['ma_nv']);
        $sheet->setCellValue('C' . $rowCount, $row['ten_nv']);
        $sheet->setCellValue('D' . $rowCount, $row['ten_chuc_vu']);
        $sheet->setCellValue('E' . $rowCount, $row['ngay_bat_dau']);
        $sheet->setCellValue('F' . $rowCount, $row['ngay_ket_thuc']);
        $sheet->setCellValue('G' . $rowCount, $row['dia_diem']);
        $sheet->setCellValue('H' . $rowCount, strip_tags($row['muc_dich']));

        $ngayHienTai = date("Y-m-d H:i:s");
        $ngayHetHan = $row['ngay_ket_thuc'];

        if($ngayHienTai < $ngayHetHan) {
            $status = 'Đang công tác';
        } else {
            $status = 'Đã hết hạn';
        }
        $sheet->setCellValue('I' . $rowCount, $status);
    }

    // tao border
    $styleArray = array(
        'borders' => array(
            'allborders' => array(
                'style' => PHPExcel_Style_Border::BORDER_THIN
            )
        )
    );
    $sheet->getStyle('A1:' . 'I'.($rowCount))->applyFromArray($styleArray);

    // tao tac xuat file
    $objWriter = new PHPExcel_Writer_Excel2007($objExcel);
    $filename = 'lich-cong-tac.xlsx';
    $objWriter->save($filename);

    // cau hinh khi xuat file
    header('Content-Encoding: UTF-8');
    header('Content-type: text/csv; charset=UTF-8');
    header('Content-Disposition: attachment; filename="' .$filename. '"'); // tra ve file kieu attachment
    header('Content-Type: application/vnd.openxmlformatsofficedocument.spreadsheetml.sheet');
    header('Content-Legth: ' . filesize($filename));
    header('Content-Transfer-Encoding: binary');
    header('Cache-Control: must-revalidate');
    header('Pragma: no-cache');
    readfile($filename);
    return;
?>