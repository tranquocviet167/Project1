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

    // chinh sua thong tin nhom
    if (isset($_POST['luuNhanVien'])) {
        // create array error
        $error = array();
        $success = array();
        $showMess = false;

        // get id in form
        $nhanVien = $_POST['nhanVien'];
        $nguoiTao = $row_acc['ho'] . $row_acc['ten'];
        $ngayTao = date("Y-m-d H:i:s");

        // validate
        if ($nhanVien == 'chon')
            $error['nhanVien'] = 'Vui lòng <b> chọn nhân viên </b>';
        // kiem tra nhan vien da ton tai
        $kt = "SELECT nhan_vien_id FROM chi_tiet_phong_ban WHERE nhan_vien_id = '$nhanVien' AND phong_ban_id = '$id'";
        $resultKT = mysqli_query($conn, $kt);
        if (mysqli_num_rows($resultKT) != 0)
            $error['tonTai'] = 'Nhân viên này <b> đã tồn tại </b> trong phòng ban';

        if (!$error) {
            $showMess = true;
            $insert = "INSERT INTO chi_tiet_phong_ban(phong_ban_id, nhan_vien_id, nguoi_tao, ngay_tao) VALUES('$id', '$nhanVien', '$nguoiTao', '$ngayTao')";
            $result = mysqli_query($conn, $insert);
            if ($result) {
                $success['success'] = 'Thêm nhân viên vào phòng ban thành công';
                echo '<script>setTimeout("window.location=\'chi-tiet-phong-ban.php?p=department&add&id=' . $id . '&add\'",1000);</script>';
            }
        }
    }

    // delete record
    if (isset($_POST['delete'])) {
        $showMess = true;
        $maPb = $_POST['maPb'];
        $delete = "DELETE FROM chi_tiet_phong_ban WHERE id = $maPb";
        mysqli_query($conn, $delete);
        $success['success'] = 'Đã xóa nhân viên ra khỏi phòng ban thành công.';
        echo '<script>setTimeout("window.location=\'chi-tiet-phong-ban.php?p=department&id=' . $id . '\'",1000);</script>';
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
                    <?php if (!isset($_GET['add'])) : ?>
                        <div class="box box-primary">
                            <div class="box-header">
                                <h3 class="box-title">Thao tác phòng ban</h3>
                            </div>
                            <div class="box-body">
                                <a href="sua-phong-ban.php?p=department&id=<?php echo $id; ?>&edit" class="btn btn-app">
                                    <i class="fa fa-edit"></i> Chỉnh sửa phòng ban
                                </a>
                                <a href="chi-tiet-phong-ban.php?p=department&id=<?php echo $id; ?>&add" class="btn btn-app">
                                    <i class="fa fa-plus"></i> Thêm nhân viên
                                </a>
                                <a href="danh-sach-phong-ban.php?p=department" class="btn btn-app">
                                    <i class="fa fa-close"></i> Hủy bỏ
                                </a>
                            </div>
                            <!-- /.box-body -->
                        </div>
                    <?php endif; ?>
                    <?php
                    if (isset($_GET['add'])) {
                    ?>
                        <div class="box box-primary">
                            <div class="box-header with-border">
                                <h3 class="box-title">Thêm nhân viên vào phòng ban</h3>
                                <div class="box-tools pull-right">
                                    <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
                                    <button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-remove"></i></button>
                                </div>
                            </div>
                            <!-- /.box-header -->
                            <div class="box-body">
                                <?php
                                // show error
                                if ($row_acc['quyen'] != 1) {
                                    echo "<div class='alert alert-warning alert-dismissible'>";
                                    echo "<h4><i class='icon fa fa-ban'></i> Thông báo!</h4>";
                                    echo "Bạn <b> không có quyền </b> thực hiện chức năng này.";
                                    echo "</div>";
                                }
                                ?>

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
                                <form action="" method="POST">
                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="form-group">
                                                <label for="exampleInputEmail1">Mã phòng ban : </label>
                                                <input type="text" class="form-control" id="exampleInputEmail1" name="ma_phong_ban" value="<?php echo $id; ?>" readonly>
                                            </div>
                                            <div class="form-group">
                                                <label for="exampleInputEmail1">Chọn nhân viên: </label>
                                                <select class="form-control" name="nhanVien">
                                                    <option value="chon">--- Chọn nhân viên ---</option>
                                                    <?php
                                                    foreach ($nvhow as $nv) {
                                                        echo "<option value='" . $nv['id'] . "'>" . $nv['ma_nv'] . " - " . $nv['ten_nv'] . "</option>";
                                                    }
                                                    ?>
                                                </select>
                                            </div>
                                            <div class="form-group">
                                                <label for="exampleInputEmail1">Người thêm: </label>
                                                <input type="text" class="form-control" id="exampleInputEmail1" value="<?php echo $row_acc['ho'];
                                                                                                                        echo " ";
                                                                                                                        echo $row_acc['ten']; ?>" name="nguoiTao" readonly>
                                            </div>
                                            <div class="form-group">
                                                <label for="exampleInputEmail1">Ngày thêm: </label>
                                                <input type="text" class="form-control" id="exampleInputEmail1" value="<?php echo date('d-m-Y H:i:s'); ?>" name="ngayTao" readonly>
                                            </div>
                                            <!-- /.form-group -->
                                            <?php
                                            if ($_SESSION['level'] == 1)
                                                echo "<button type='submit' class='btn btn-primary' name='luuNhanVien'><i class='fa fa-plus'></i> Thêm nhân viên</button>";
                                            ?>
                                        </div>
                                        <!-- /.col -->
                                    </div>
                                    <!-- /.row -->
                                </form>
                            </div>
                            <!-- /.box-body -->
                        </div>
                    <?php
                    }
                    ?>
                    <!-- /.box -->
                    <div class="box">
                        <div class="box-header">
                            <h3 class="box-title">Nhân viên trong phòng ban</h3>
                        </div>
                        <!-- /.box-header -->
                        <div class="box-body">
                            <?php
                            // show error
                            if ($row_acc['quyen'] != 1) {
                                echo "<div class='alert alert-warning alert-dismissible'>";
                                echo "<h4><i class='icon fa fa-ban'></i> Thông báo!</h4>";
                                echo "Bạn <b> không có quyền </b> thực hiện chức năng này.";
                                echo "</div>";
                            }
                            ?>

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
                                            <th>Xóa</th>
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
                                                <th>
                                                    <?php
                                                    if ($row_acc['quyen'] == 1) {
                                                        echo "<button type='button' class='btn bg-maroon btn-flat' data-toggle='modal' data-target='#exampleModal' data-whatever='" . $pb['id'] . "'><i class='fa fa-trash'></i></button>";
                                                    } else {
                                                        echo "<button type='button' class='btn bg-maroon btn-flat' disabled><i class='fa fa-trash'></i></button>";
                                                    }
                                                    ?>
                                                </th>
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