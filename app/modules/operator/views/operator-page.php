<style type="text/css">
thead, tbody { display: block; }

tbody {
    /* height: 100px; */       /* Just for the demo          */
    overflow-y: auto;    /* Trigger vertical scroll    */
    overflow-x: auto;  /* Hide the horizontal scroll */
}
</style>
  <!-- Full Width Column -->
  <div class="content-wrapper" style="min-height: 901px;">
      <!-- Content Header (Page header) -->
      <section class="content-header">
        <h1>
          Menu Operator
        </h1>
        <ol class="breadcrumb">
          <li><a href="#"><i class="fa fa-dashboard"></i> Dashboard</a></li>
        </ol>
      </section>
      <?php 
      $grup = $this->alus_auth->get_users_groups($this->session->userdata('user_id'));
      ?>
      <!-- Main content -->
      <section class="content">
        <div class="row">
        
        </div>
        <!-- ./col -->
      </div>
      </section>
      <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->

  <div id="show_list" class="modal fade" role="dialog">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h3 class="modal-title">Pop Up</h3>
      </div>
      <div class="modal-body">
        <table id="table_list" class="table table-bordered">
          <thead style="background-color: #F9F9F9;">
          </thead>
          <tbody id="list_data">
          </tbody>
          <tfoot></tfoot>
        </table>
      </div>
      <div class="modal-footer">

      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

  <script type="text/javascript">
  $( document ).ready(function() {

  });
  </script>