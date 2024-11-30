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
    // show data
    $showData = "SELECT pb.* FROM phong_ban as pb INNER JOIN chi_tiet_phong_ban as ctpb ON pb.id = ctpb.phong_ban_id WHERE nhan_vien_id = $idNV ORDER BY ngay_tao DESC";
    $result = mysqli_query($conn, $showData);
    $arrShow = array();
    while ($row = mysqli_fetch_array($result)) {
        $arrShow[] = $row;
    }


    // xoa nhom
    if (isset($_GET['id'])) {
        $showMess = true;

        $id = $_GET['id'];

        $delete = "DELETE FROM phong_ban WHERE id = $id";
        mysqli_query($conn, $delete);
        $success['success'] = 'Xóa phòng ban thành công.';
        echo '<script>setTimeout("window.location=\'danh-sach-phong-ban.php?p=department\'",1000);</script>';
    }

?>

    <!-- Content Wrapper. Contains page content -->
    <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <section class="content-header">
            <h1>
                Quản lý phòng ban
            </h1>
            <ol class="breadcrumb">
                <li><a href="index.php?p=index&a=statistic"><i class="fa fa-dashboard"></i> Tổng quan</a></li>
                <li class="active">Quản lý phòng ban</li>
            </ol>
        </section>
        <!-- Main content -->
        <section class="content">
            <div class="row">

                <div class="col-lg-12">

                    <?php
                    // show error
                    if (isset($error)) {
                        if ($showMess == false) {
                            echo "<div class='alert alert-danger alert-dismissible'>";
                            echo "<button type='button' class='close' data-dismiss='alert' aria-hidden='true'>&times;</button>";
                            echo "<h4><i class='icon fa fa-ban'></i> Lỗi!</h4>";
                            foreach ($error as $err) {
                                echo $err . "<br/>";
                            }
                            echo "</div>";
                        }
                    }
                    ?>
                    <?php
                    // show success
                    if (isset($success)) {
                        if ($showMess == true) {
                            echo "<div class='alert alert-success alert-dismissible'>";
                            echo "<h4><i class='icon fa fa-check'></i> Thành công!</h4>";
                            foreach ($success as $suc) {
                                echo $suc . "<br/>";
                            }
                            echo "</div>";
                        }
                    }
                    ?>
                </div>
            </div>
            <!-- Small boxes (Stat box) -->
            <div class="row">
                <?php
                foreach ($arrShow as $phongban) {
                    $idPhongBan = $phongban['id'];
                    // dem so luong thanh vien
                    $soLuong = "SELECT count(nhan_vien_id) as soluong FROM chi_tiet_phong_ban WHERE phong_ban_id = '$idPhongBan'";
                    $resultSoLuong = mysqli_query($conn, $soLuong);
                    $rowSoluong = mysqli_fetch_array($resultSoLuong);
                ?>
                    <div class="col-lg-3 col-xs-6">
                        <!-- small box -->
                        <div class="small-box bg-aqua">
                            <div class="inner">
                                <h3><?php echo $rowSoluong['soluong']; ?></h3>
                                <h5 style="font-weight: bold;"><?php echo $phongban['ten_phong_ban']; ?></h5>

                            </div>
                            <div class="icon">
                                <i class="fa fa-users"></i>
                            </div>
                            <?php if ($row_acc['quyen']) : ?>
                                <a onclick="return confirm('Bạn có thực sự muốn xóa phòng ban này?')" href="danh-sach-phong-ban.php?p=department&delete&id=<?php echo $phongban['id']; ?>" class="small-box-footer">Xóa phòng ban <i class="fa fa-trash"></i></a>
                            <?php else : ?>
                                <a href="chi-tiet-phong-ban-nhan-vien.php?p=department&a=list-department&id=<?php echo $phongban['id']; ?>" class="small-box-footer" style='color: #fff;'>Chi tiết phòng ban <i class="fa fa-arrow-circle-right"></i></a>
                            <?php endif; ?>
                        </div>
                    </div>
                <?php
                }
                ?>
                <!-- ./col -->
            </div>
            <!-- /.row -->
        </section>
        <!-- /.content -->
    </div>
    <!-- /.content-wrapper -->

<?php
    // include
    include('../layouts/footer.php');
} else {
    // go to pages login
    header('Location: dang-nhap.php');
}

?>