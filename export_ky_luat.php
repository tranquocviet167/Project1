<?php

    // PHPExcel
    include('Classes/PHPExcel.php');
    // connect database
    require_once('../config.php');

    // export file excel
    ob_end_clean();
    $objExcel = new PHPExcel;
    $objExcel->setActiveSheetIndex(0);
    $sheet = $objExcel->getActiveSheet()->setTitle('Kỷ luật');

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
    $sheet->getColumnDimension("J")->setAutoSize(true);
    // chinh mau dong title
    $sheet->getStyle('A1:J1')->getFill()->setFillType(\PHPExcel_Style_Fill::FILL_SOLID)->getStartColor()->setARGB('00ffff00');
    // canh giua
    $sheet->getStyle('A1:J1')->getAlignment()->setHorizontal(PHPExcel_Style_Alignment::HORIZONTAL_CENTER);

    // dem so dong
    $rowCount = 1;
    // set cho dong dau tien (dong tieu de)
    $sheet->setCellValue('A' . $rowCount, 'STT');
    $sheet->setCellValue('B' . $rowCount, 'Mã kỷ luật');
    $sheet->setCellValue('C' . $rowCount, 'Tên kỷ luật');
    $sheet->setCellValue('D' . $rowCount, 'Tên nhân viên');
    $sheet->setCellValue('E' . $rowCount, 'Số quyết định');
    $sheet->setCellValue('F' . $rowCount, 'Ngày quyết định');
    $sheet->setCellValue('G' . $rowCount, 'Tên loại');
    $sheet->setCellValue('H' . $rowCount, 'Hình thức');
    $sheet->setCellValue('I' . $rowCount, 'Số tiền');
    $sheet->setCellValue('J' . $rowCount, 'Ngày kỷ luật');

// hien thi ky luat
    $kt = "SELECT ktkl.id as id, ma_kt, ten_khen_thuong, ten_nv, so_qd, ngay_qd, ten_loai, hinh_thuc, so_tien, ktkl.ngay_tao as ngay_tao FROM khen_thuong_ky_luat ktkl, nhanvien nv, loai_khen_thuong_ky_luat lktkl WHERE ktkl.nhanvien_id = nv.id AND ktkl.loai_kt_id = lktkl.id AND ktkl.flag = 0 ORDER BY ktkl.ngay_tao DESC";
    $resultKT = mysqli_query($conn, $kt);
    $arrKT = array();
    $stt = 0;

    while ($rowKT = mysqli_fetch_array($resultKT)) {

        $rowCount++;
        $stt++;
        // do het du lieu ra cac dong
        $sheet->setCellValue('A' . $rowCount, $stt);
        $sheet->setCellValue('B' . $rowCount, $rowKT['ma_kt']);
        $sheet->setCellValue('C' . $rowCount, $rowKT['ten_khen_thuong']);
        $sheet->setCellValue('D' . $rowCount, $rowKT['ten_nv']);
        $sheet->setCellValue('E' . $rowCount, $rowKT['so_qd']);
        $sheet->setCellValue('F' . $rowCount, date_format(date_create($rowKT['ngay_qd']), "d-m-Y"));
        $sheet->setCellValue('G' . $rowCount, $rowKT['ten_loai']);
        if ($rowKT['hinh_thuc'] == 1) {
            $hinh_thuc = 'Trừ tiền qua thẻ';
        } else {
            $hinh_thuc = 'Trừ tiền mặt';
        }

        $sheet->setCellValue('H' . $rowCount, $hinh_thuc);
        $sheet->setCellValue('I' . $rowCount, number_format($rowKT['so_tien']). 'vnđ');
        $sheet->setCellValue('J' . $rowCount, date_format(date_create($rowKT['ngay_tao']), "d-m-Y"));
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
    $filename = 'ky_luat.xlsx';
    $objWriter->save($filename);

    // cau hinh khi xuat file
    header('Content-Disposition: attachment; filename="' .$filename. '"'); // tra ve file kieu attachment
    header('Content-Type: application/vnd.openxmlformatsofficedocument.spreadsheetml.sheet');
    header('Content-Legth: ' . filesize($filename));
    header('Content-Transfer-Encoding: binary');
    header('Cache-Control: must-revalidate');
    header('Pragma: no-cache');
    readfile($filename);
    return;