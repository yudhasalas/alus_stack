<div class="modal-content">
  <div class="modal-header">
    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
    <h4 class="modal-title" id="myModalLabel"><?php echo $title; ?></h4>
  </div>
  <div class="modal-body">
    <!-- FORM -->
    <form id="form_edit">
        <input type="hidden" name="tmc_id" value="<?php echo $data_id->tmc_id; ?>" required>
        <input type="hidden" name="<?=$this->security->get_csrf_token_name();?>" value="<?=$this->security->get_csrf_hash();?>" />
        <!-- KONTEN -->
        <div class="form-group">
          <label>Pilih Kategori :</label>
          <select name="kategori" class="form-control">
            <?php foreach ($data->result() as $value) {
              if($value->td_code == $data_id->tmc_kategori)
              {
                echo '<option value="'.$value->td_code.'" selected="selected">'.$value->td_name.'</option>';
              }else{
                echo '<option value="'.$value->td_code.'">'.$value->td_name.'</option>';
              }
            } ?>
          </select>
        </div>
        <!-- END KONTEN -->
    </form>
    <!-- END FORM -->
  </div>
  <div class="modal-footer">
    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
    <button type="button" onClick="btn_save_edit()" class="btn btn-primary">Save changes</button>
  </div>