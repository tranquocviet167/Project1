<?php

// create session
session_start();

if (isset($_SESSION['username']) && isset($_SESSION['level'])) {
    // include file
    include('../layouts/header.php');
    include('../layouts/topbar.php');
    include('../layouts/sidebar.php');

    if (!isset($_GET['maNhanVien'])) {
        $url = 'thong-tin-nhan-vien.php?p=account&a=info-account&id=' . $row_nv['id'];
        header("Location: $url");
    }
    $idNV = $_GET['maNhanVien'];

    if (isset($_POST['suaLoai'])) {
        $id = $_POST['idLoai'];
        echo "<script>location.href='sua-loai-khen-thuong.php?p=bonus-discipline&a=bonus&id=" . $id . "'</script>";
    }

    if (isset($_POST['suaKhenThuong'])) {
        $id = $_POST['idKhenThuong'];
        echo "<script>location.href='sua-khen-thuong.php?p=bonus-discipline&a=bonus&id=" . $id . "'</script>";
    }

    // hien thi loai khen thuong
    $showData = "SELECT id, ma_loai, ten_loai, ghi_chu, nguoi_tao, ngay_tao, nguoi_sua, ngay_sua FROM loai_khen_thuong_ky_luat WHERE flag = 1 ORDER BY ngay_tao DESC";
    $result = mysqli_query($conn, $showData);
    $arrShow = array();
    while ($row = mysqli_fetch_array($result)) {
        $arrShow[] = $row;
    }

    // hien thi khen thuong
    $kt = "SELECT ktkl.id as id, ma_kt, ten_khen_thuong, ten_nv, so_qd, ngay_qd, ten_loai, hinh_thuc, so_tien, ktkl.ngay_tao as ngay_tao FROM khen_thuong_ky_luat ktkl, nhanvien nv, loai_khen_thuong_ky_luat lktkl WHERE ktkl.nhanvien_id = nv.id AND ktkl.loai_kt_id = lktkl.id AND ktkl.flag = 1 AND ktkl.nhanvien_id = $idNV ORDER BY ktkl.ngay_tao DESC";
    $resultKT = mysqli_query($conn, $kt);
    $arrKT = array();
    while ($rowKT = mysqli_fetch_array($resultKT)) {
        $arrKT[] = $rowKT;
    }

    // hien thi nhan vien
    $nv = "SELECT id, ma_nv, ten_nv FROM nhanvien ORDER BY id DESC";
    $resultNV = mysqli_query($conn, $nv);
    $arrNV = array();
    while ($rowNV = mysqli_fetch_array($resultNV)) {
        $arrNV[] = $rowNV;
    }

    // create code 
    $maLoai = "LKT" . time();
    $maKhenThuong = "MKT" . time();

    // them loai khen thuong
    if (isset($_POST['taoLoai'])) {
        // create array error
        $error = array();
        $success = array();
        $showMess = false;

        // get id in form
        $tenLoai = $_POST['tenLoai'];
        $moTa = $_POST['moTa'];
        $flag = 1;
        $nguoiTao = $_POST['nguoiTao'];
        $ngayTao = date("Y-m-d H:i:s");

        // validate
        if (empty($tenLoai))
            $error['tenLoai'] = 'Vui lòng nhập <b> tên loại </b>';

        if (!$error) {
            $showMess = true;
            $insert = "INSERT INTO loai_khen_thuong_ky_luat(ma_loai, ten_loai, ghi_chu, flag, nguoi_tao, ngay_tao, nguoi_sua, ngay_sua) VALUES('$maLoai','$tenLoai','$moTa', '$flag', '$nguoiTao', '$ngayTao', '$nguoiTao', '$ngayTao')";
            $result = mysqli_query($conn, $insert);
            if ($result) {
                $success['success'] = 'Tạo loại khen thưởng thành công';
                echo '<script>setTimeout("window.location=\'khen-thuong.php?p=bonus-discipline&a=bonus&tao-loai\'",1000);</script>';
            }
        }
    }
?>
    <!-- Modal -->
    <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <form method="POST">
                    <div class="modal-header">
                        <span style="font-size: 18px;">Thông báo</span>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <input type="hidden" name="id">
                        Bạn có thực sự muốn xóa <?php if (isset($_GET['tao-loai'])) {
                                                    echo "loại khen thưởng";
                                                } else {
                                                    echo "khen thưởng";
                                                } ?> này?
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Hủy bỏ</button>
                        <button type="submit" class="btn btn-primary" name="delete">Xóa</button>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <!-- Content Wrapper. Contains page content -->
    <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <section class="content-header">
            <h1>
                Khen thưởng
            </h1>
            <ol class="breadcrumb">
                <li><a href="index.php?p=index&a=statistic"><i class="fa fa-dashboard"></i> Tổng quan</a></li>
                <li><a href="khen-thuong.php?p=bonus-discipline&a=bonus">Khen thưởng</a></li>
                <li class="active">Khen thưởng nhân viên</li>
            </ol>
        </section>

        <!-- Main content -->
        <section class="content">
            <div class="row">
                <div class="col-xs-12">

                    <div class="box">
                        <div class="box-header">
                            <h3 class="box-title">Danh sách khen thưởng</h3>
                        </div>
                        <!-- /.box-header -->
                        <div class="box-body">
                            <?php if (! empty($arrKT)) : ?>
                            <div class="table-responsive">
                                <table id="example1" class="table table-bordered table-striped">
                                    <thead>
                                        <tr>
                                            <th>STT</th>
                                            <th>Mã khen thưởng</th>
                                            <th>Tên khen thưởng</th>
                                            <th>Tên nhân viên</th>
                                            <th>Số quyết định</th>
                                            <th>Ngày quyết định</th>
                                            <th>Tên loại</th>
                                            <th>Hình thức</th>
                                            <th>Số tiền</th>
                                            <th>Ngày khen thưởng</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <?php
                                        $count = 1;
                                        foreach ($arrKT as $kt) {
                                        ?>
                                            <tr>
                                                <td><?php echo $count; ?></td>
                                                <td><?php echo $kt['ma_kt']; ?></td>
                                                <td><?php echo $kt['ten_khen_thuong']; ?></td>
                                                <td><?php echo $kt['ten_nv']; ?></td>
                                                <td><?php echo $kt['so_qd']; ?></td>
                                                <td><?php echo date_format(date_create($kt['ngay_qd']), "d-m-Y"); ?></td>
                                                <td><?php echo $kt['ten_loai']; ?></td>
                                                <td>
                                                    <?php
                                                    if ($kt['hinh_thuc'] == 1) {
                                                        echo "Chuyển khoản qua thẻ";
                                                    } else {
                                                        echo "Gửi tiền mặt";
                                                    }
                                                    ?>
                                                </td>
                                                <td><?php echo "<span style='color: blue; font-weight: bold;'>" . number_format($kt['so_tien']) . "vnđ </span>"; ?></td>
                                                <td><?php echo date_format(date_create($kt['ngay_tao']), "d-m-Y"); ?></td>

                                            </tr>
                                        <?php
                                            $count++;
                                        }
                                        ?>
                                    </tbody>
                                </table>
                            </div>
                            <?php else : ?>
                                <h4 class="text-center">Hiện tại nhân viên này chưa có khen thưởng!</h4>
                            <?php endif; ?>
                        </div>
                        <!-- /.box-body -->
                    </div>
                    <!-- /.box -->
                </div>
                <!-- /.col -->
            </div>
            <!-- /.row -->
        </section>
        <!-- /.content -->
    </div>

<?php
    // include
    include('../layouts/footer.php');
} else {
    // go to pages login
    header('Location: dang-nhap.php');
}

?>