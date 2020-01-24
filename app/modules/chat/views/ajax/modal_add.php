<div class="modal-content">
  <div class="modal-header">
    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
    <h4 class="modal-title" id="myModalLabel">Kategori</h4>
  </div>
  <div class="modal-body">
    <!-- FORM -->
    <form id="form_add">
      <!-- KONTEN -->
        <input type="hidden" name="<?=$this->security->get_csrf_token_name();?>" value="<?=$this->security->get_csrf_hash();?>" />
        <div class="form-group">
          <label>Nama Kategori</label>
          <input type="text" class="form-control" name="tk_nama">
        </div>
        <div class="form-group">
          <div class="callout callout-warning">
            <p>Panduan Ukuran Gambar: L: 600px T: 400px</p>
          </div>
        </div>
        <div class="form-group">
          <label>Gambar</label>
          <input type="file" name="userfile">
        </div>
      <!-- END KONTEN -->
    </form>
    <!-- END FORM -->
  </div>
  <div class="modal-footer">
    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
    <button type="button" onClick="btn_save_add()" class="btn btn-primary">Save changes</button>
  </div>
</div>