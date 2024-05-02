<?php 
if (session_status() == PHP_SESSION_NONE) {
  session_start();
}

var_dump($_SESSION['userdata']);
?>


<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>


</head>
<body>
<style>
  .info-tooltip,.info-tooltip:focus,.info-tooltip:hover{
    background:unset;
    border:unset;
    padding:unset;
  }
</style>
<h1>Welcome to <?php echo $_settings->info('name') ?></h1>
<hr>
<div class="row">
          <div class="col-12 col-sm-6 col-md-3">
            <div class="info-box">
              <span class="info-box-icon bg-primary elevation-1"><i class="fas fa-money-bill-alt"></i></span>

              <div class="info-box-content">
                <span class="info-box-text">Overall Alloted Budget</span>
                <span class="info-box-number text-right">
                  <?php 
                    $cur_bul = $conn->query("SELECT sum(balance) as total FROM `categories` where status = 1 ")->fetch_assoc()['total'];
                    echo number_format($cur_bul);
                  ?>
                  <?php ?>
                </span>
              </div>
              <!-- /.info-box-content -->
            </div>
            <!-- /.info-box -->
          </div>
          <!-- /.col -->
          <!-- <div class="col-12 col-sm-6 col-md-3">
            <div class="info-box mb-3">
              <span class="info-box-icon bg-info elevation-1"><i class="fas fa-calendar-day"></i></span>

              <div class="info-box-content">
                <span class="info-box-text">Total Budget Entries</span>
                <span class="info-box-number text-right">
                  <?php 
                    $today_budget = $conn->query("SELECT sum(amount) as total FROM `running_balance` where category_id in (SELECT id FROM categories where status =1) and date(date_created) = '".(date("Y-m-d"))."' and balance_type = 1 ")->fetch_assoc()['total'];
                    echo number_format($today_budget);
                  ?>
                </span>
              </div>
             
            </div>
            
          </div> -->
      

          <!-- fix for small devices only -->
          <div class="clearfix hidden-md-up"></div>

          <div class="col-12 col-sm-6 col-md-3">
            <div class="info-box mb-3">
              <span class="info-box-icon bg-warning elevation-1"><i class="fas fa-calendar-day"></i></span>

              <div class="info-box-content">
                <span class="info-box-text">Total Expenses</span>
                <span class="info-box-number text-right">
                <?php 
                    $today_expense = $conn->query("SELECT sum(amount) as total FROM `running_balance` where category_id in (SELECT id FROM categories where status =1) and date(date_created) = '".(date("Y-m-d"))."' and balance_type = 2 ")->fetch_assoc()['total'];
                    echo number_format($today_expense);
                  ?>
                </span>
              </div>
              <!-- /.info-box-content -->
            </div>
            <!-- /.info-box -->
          </div>
        </div>
<div class="row">
  <div class="col-lg-12">
    <h4>Alloted Budget in each Categories</h4>
    <hr>
  </div>
</div>
<div class="col-md-12 d-flex justify-content-center">
  <div class="input-group mb-3 col-md-5">
    <input type="text" class="form-control" id="search" placeholder="Search Category">
    <div class="input-group-append">
      <span class="input-group-text"><i class="fa fa-search"></i></span>
    </div>
  </div>
</div>
<div class="row row-cols-4 row-cols-sm-1 row-cols-md-4 row-cols-lg-4">
  <?php 
  $categories = $conn->query("SELECT * FROM `categories` where status = 1 order by `category` asc ");
    while($row = $categories->fetch_assoc()):
  ?>
  <div class="col p-2 cat-items">
    <div class="callout callout-info">
      <span class="float-right ml-1">
        <button type="button" class="btn btn-secondary info-tooltip" data-toggle="tooltip" data-html="true" title='<?php echo (html_entity_decode($row['description'])) ?>'>
          <span class="fa fa-info-circle text-info"></span>
        </button>
      </span>
      <h5 class="mr-4"><b><?php echo $row['category'] ?></b></h5>
      <div class="d-flex justify-content-end">
        <b><?php echo number_format($row['balance']) ?></b>
      </div>
    </div>
  </div>
  <?php endwhile; ?>
</div>
<div class="col-md-12">
  <h3 class="text-center" id="noData" style="display:none">No Data to display.</h3>
</div>


<!-- <canvas id="myBarChart" width="100" height="30"></canvas>

<?php
// Sample data for the bar graph
$labels = ['Groceries', 'Transportation', 'Meals and Snacks', 'Utilities', 'Rent', 'Personal Care Products', 'Entertainment', 'Communication Services','Household Supplies'];
$data = [65, 59, 80, 81, 56, 23, 12, 65, 22, 54];
?> -->





<script>

    // var ctx = document.getElementById('myBarChart').getContext('2d');
    // var myBarChart = new Chart(ctx, {
    //     type: 'bar',
    //     data: {
    //         labels: <?php echo json_encode($labels); ?>,
    //         datasets: [{
    //             label: 'Expense Graph',
    //             data: <?php echo json_encode($data); ?>,
    //             backgroundColor: [
    //               'rgba(255, 99, 132, 0.2)',
    //               'rgba(255, 159, 64, 0.2)',
    //               'rgba(255, 205, 86, 0.2)',
    //               'rgba(75, 192, 192, 0.2)',
    //               'rgba(54, 162, 235, 0.2)',
    //               'rgba(153, 102, 255, 0.2)',
    //               'rgba(201, 203, 207, 0.2)'
    //             ],
    //             borderColor: [
    //               'rgb(255, 99, 132)',
    //               'rgb(255, 159, 64)',
    //               'rgb(255, 205, 86)',
    //               'rgb(75, 192, 192)',
    //               'rgb(54, 162, 235)',
    //               'rgb(153, 102, 255)',
    //               'rgb(201, 203, 207)'
    //             ],
    //             borderWidth: 1
    //         }]
    //     },
    //     options: {
    //         scales: {
    //             y: {
    //                 beginAtZero: true
    //             }
    //         }
    //     }
    // });







  function check_cats(){
    if($('.cat-items:visible').length > 0){
      $('#noData').hide('slow')
    }else{
      $('#noData').show('slow')
    }
  }
  $(function(){
    $('[data-toggle="tooltip"]').tooltip({
      html:true
    })
    check_cats()
    $('#search').on('input',function(){
      var _f = $(this).val().toLowerCase()
      $('.cat-items').each(function(){
        var _c = $(this).text().toLowerCase()
        if(_c.includes(_f) == true)
          $(this).toggle(true);
        else
          $(this).toggle(false);
      })
    check_cats()
    })
  })
</script>

</body>
</html>
