<?php

// create session
session_start();

if (isset($_SESSION['username']) && isset($_SESSION['level'])) {
    // include file
    include('../layouts/header.php');
    include('../layouts/topbar.php');
    include('../layouts/sidebar.php');

    if (isset($_GET['id'])) {
        $id = $_GET['id'];
        $phongban = "SELECT * FROM phong_ban WHERE id = '$id'";
        $resultPhongBan = mysqli_query($conn, $phongban);
        $rowPhongBan = mysqli_fetch_array($resultPhongBan);
    }

    // show data
    $showData = "SELECT id, ma_nv, ten_nv FROM nhanvien ORDER BY id DESC";
    $result = mysqli_query($conn, $showData);
    $nvhow = array();
    while ($row = mysqli_fetch_array($result)) {
        $nvhow[] = $row;
    }

    // hien thi nhan vien trong nhom
    $pb = "SELECT ctpb.id as id, ma_nv, hinh_anh, ten_nv, gioi_tinh, ngay_sinh, ten_chuc_vu, ctpb.ngay_tao as ngay_tao, trang_thai 
    FROM chi_tiet_phong_ban ctpb, nhanvien nv, chuc_vu cv 
    WHERE ctpb.nhan_vien_id = nv.id AND nv.chuc_vu_id = cv.id AND ctpb.phong_ban_id = '$id'";

    $resultPb = mysqli_query($conn, $pb);
    $arrPb = array();
    while ($rowPb = mysqli_fetch_array($resultPb)) {
        $arrPb[] = $rowPb;
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
                        <input type="hidden" name="maPb">
                        Bạn có thực sự muốn xóa nhân viên này ra khỏi phòng ban?
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
                Quản lý phòng ban : <?php echo $rowPhongBan['ten_phong_ban'] ?>
            </h1>
            <ol class="breadcrumb">
                <li><a href="index.php?p=index&a=statistic"><i class="fa fa-dashboard"></i> Tổng quan</a></li>
                <li><a href="danh-sach-phong-ban.php?p=department">Quản lý phòng ban</a></li>
                <li class="active">Chi tiết phòng ban</li>
            </ol>
        </section>

        <!-- Main content -->
        <section class="content">
            <div class="row">
                <div class="col-xs-12">
                    <!-- /.box -->
                    <div class="box">
                        <div class="box-header">
                            <h3 class="box-title">Nhân viên trong phòng ban</h3>
                        </div>
                        <!-- /.box-header -->
                        <div class="box-body">
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
                            <div class="table-responsive">
                                <table id="example1" class="table table-bordered table-striped">
                                    <thead>
                                        <tr>
                                            <th>STT</th>
                                            <th>Mã nhân viên</th>
                                            <th>Ảnh</th>
                                            <th>Tên nhân viên</th>
                                            <th>Giới tính</th>
                                            <th>Năm sinh</th>
                                            <th>Chức vụ</th>
                                            <th>Ngày thêm</th>
                                            <th>Trạng thái</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <?php
                                        $count = 1;
                                        foreach ($arrPb as $pb) {
                                        ?>
                                            <tr>
                                                <td><?php echo $count; ?></td>
                                                <td><?php echo $pb['ma_nv']; ?></td>
                                                <td><img src="../uploads/staffs/<?php echo $pb['hinh_anh']; ?>" width="80"></td>
                                                <td><?php echo $pb['ten_nv']; ?></td>
                                                <td>
                                                    <?php
                                                    if ($pb['gioi_tinh'] == 1) {
                                                        echo "Nam";
                                                    } else {
                                                        echo "Nữ";
                                                    }
                                                    ?>
                                                </td>
                                                <td>
                                                    <?php
                                                    $date = date_create($pb['ngay_sinh']);
                                                    echo date_format($date, 'd-m-Y');
                                                    ?>
                                                </td>
                                                <td><?php echo $pb['ten_chuc_vu']; ?></td>
                                                <td>
                                                    <?php
                                                    $ngayThem = date_create($pb['ngay_tao']);
                                                    echo date_format($ngayThem, 'd-m-Y');
                                                    ?>
                                                </td>
                                                <td>
                                                    <?php
                                                    if ($pb['trang_thai'] == 1) {
                                                        echo '<span class="badge bg-blue"> Đang làm việc </span>';
                                                    } else {
                                                        echo '<span class="badge bg-red"> Đã nghỉ việc </span>';
                                                    }
                                                    ?>
                                                </td>
                                            </tr>
                                        <?php
                                            $count++;
                                        }
                                        ?>
                                    </tbody>
                                </table>
                            </div>
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