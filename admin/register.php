<?php require_once('../config.php') ?>
<!DOCTYPE html>
<html lang="en" class="" style="height: auto;">
<?php require_once('inc/header.php') ?>

<body class="hold-transition login-page bg-navy">

    <script>
    start_loader()
    </script>
   

    <main class="d-flex">

    <aside class="w-100 mx-4">
        <img src="../assets/images/bg-image.png" alt="buddyget-background-image" class="w-100 h-100">
    </aside>

    <div class="login-box _form w-100 mx-4">
    <h2 class="text-center mb-4 pb-3"><?php echo $_settings->info('name') ?>
    </h2>
        <!-- /.login-logo -->
        <div class="card card-outline card-primary">
            <div class="card-body">
                <p class="login-box-msg text-dark">Register</p>

                <!-- Registration Form -->
<form id="register-frm" method="post" action="">
    <div class="input-group mb-3">
        <input type="text" class="form-control" name="username" placeholder="Username" autofocus>
        <div class="input-group-append">
            <div class="input-group-text">
                <span class="fas fa-user"></span>
            </div>
        </div>
    </div>
    <div class="input-group mb-3">
        <input type="password" class="form-control" name="reg_pass" placeholder="Password">
        <!-- Add password visibility toggle button -->
        <div class="input-group-append">
            <div class="input-group-text">
                <span class="fas fa-eye-slash toggle-password"></span>
            </div>
        </div>
        <div class="input-group-append">
            <div class="input-group-text">
                <span class="fas fa-lock"></span>
            </div>
        </div>
    </div>
    <div class="input-group mb-3">
        <input type="password" class="form-control" name="confirm_reg_pass" placeholder="Confirm Password">
        <!-- Add password visibility toggle button -->
        <div class="input-group-append">
            <div class="input-group-text">
                <span class="fas fa-eye-slash toggle-password"></span>
            </div>
        </div>
        <div class="input-group-append">
            <div class="input-group-text">
                <span class="fas fa-lock"></span>
            </div>
        </div>
    </div>
    <div class="row justify-content-center">
        <button type="submit" class="btn btn-primary btn-block">Sign Up</button>
        <p class="text-dark mt-2 d-block mx-auto">Already have an account? <span><a href="./login.php">Login</a></span></p>
                            <!-- /.col -->
    </div>
    
</form>

        

            </div>
            <!-- /.card-body -->
        </div>
        <!-- /.card -->
    </div>
    

    </main>
   

    <!-- jQuery -->
    <script src="plugins/jquery/jquery.min.js"></script>
    <!-- Bootstrap 4 -->
    <script src="plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
    <!-- AdminLTE App -->
    <script src="dist/js/adminlte.min.js"></script>

    <script>
    $(document).ready(function() {
        end_loader();

        $('.toggle-password').click(function() {
        $(this).toggleClass('fa-eye fa-eye-slash');
        var input = $($(this).closest('.input-group').find('input'));
        if (input.attr('type') === 'password') {
            input.attr('type', 'text');
        } else {
            input.attr('type', 'password');
        }
    });
    })
    
  
    </script>

   
</body>

</html>
