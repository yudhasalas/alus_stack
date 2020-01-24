<style>
  /* CSS talk bubble */
img{ max-width:100%;}
.inbox_people {
  background: #f8f8f8 none repeat scroll 0 0;
  float: left;
  overflow: hidden;
  width: 40%; border-right:1px solid #c4c4c4;
}
.inbox_msg {
  clear: both;
  overflow: hidden;
}
.top_spac{ margin: 20px 0 0;}


.recent_heading {float: left; width:40%;}
.srch_bar {
  display: inline-block;
  text-align: right;
  width: 60%; padding:
}
.headind_srch{ padding:10px 29px 10px 20px; overflow:hidden; border-bottom:1px solid #c4c4c4;}

.recent_heading h4 {
  color: #05728f;
  font-size: 21px;
  margin: auto;
}
.srch_bar input{ border:1px solid #cdcdcd; border-width:0 0 1px 0; width:80%; padding:2px 0 4px 6px; background:none;}
.srch_bar .input-group-addon button {
  background: rgba(0, 0, 0, 0) none repeat scroll 0 0;
  border: medium none;
  padding: 0;
  color: #707070;
  font-size: 18px;
}
.srch_bar .input-group-addon { margin: 0 0 0 -27px;}

.chat_ib h5{ font-size:15px; color:#464646; margin:0 0 8px 0;}
.chat_ib h5 span{ font-size:13px; float:right;}
.chat_ib p{ font-size:14px; color:#989898; margin:auto}
.chat_img {
  float: left;
  width: 11%;
}
.chat_ib {
  float: left;
  padding: 0 0 0 15px;
  width: 88%;
}

.chat_people{ overflow:hidden; clear:both;}
.chat_list {
  border-bottom: 1px solid #c4c4c4;
  margin: 0;
  padding: 18px 16px 10px;
}
.inbox_chat { height: 550px; overflow-y: scroll;}

.active_chat{ background:#ebebeb;}

.incoming_msg_img {
  display: inline-block;
  width: 3.5%;
}
.received_msg {
  display: inline-block;
  padding: 0 0 0 10px;
  vertical-align: top;
  width: 92%;
 }
 .received_withd_msg p {
  background: #ebebeb none repeat scroll 0 0;
  border-radius: 3px;
  color: #646464;
  font-size: 14px;
  margin: 0;
  padding: 5px 10px 5px 12px;
  width: 100%;
}
.time_date {
  color: #747474;
  display: block;
  font-size: 12px;
  margin: 8px 0 0;
}
.received_withd_msg { width: 55%;}
.mesgs {
  float: left;
  padding: 0.5%;
  width: 100%;
}

 .sent_msg p {
  background: #05728f none repeat scroll 0 0;
  border-radius: 3px;
  font-size: 14px;
  margin: 0; color:#fff;
  padding: 5px 10px 5px 12px;
  width:100%;
}
.outgoing_msg{ overflow:hidden; margin:26px 0 26px;}
.sent_msg {
  float: right;
  width: 55%;
}
.input_msg_write input {
  background: rgba(0, 0, 0, 0) none repeat scroll 0 0;
  border: medium none;
  color: #4c4c4c;
  font-size: 15px;
  min-height: 48px;
  width: 100%;
}

.type_msg {border-top: 1px solid #c4c4c4;position: relative;}
.msg_send_btn {
  background: #05728f none repeat scroll 0 0;
  border: medium none;
  border-radius: 50%;
  color: #fff;
  cursor: pointer;
  font-size: 17px;
  height: 33px;
  position: absolute;
  right: 0;
  top: 11px;
  width: 33px;
}
.messaging { padding: 0 0 3% 0;}
.msg_history {
  height: 516px;
  overflow-y: auto;
}

/*CSS END*/
</style>
  <!-- Full Width Column -->
  <div class="content-wrapper" style="min-height: 88vh;padding-top: 0px !important;">
      <!-- Main content -->
      <section class="content">
        <div class="row">
          <div class="col-xs-12">
            <h3 style="margin-top: 1px;margin-bottom: 5px;"><i class="fa fa-circle-o-notch" style="font-size: 14px;"></i> Topik: <?php echo ucwords($data_topik->tmc_judul);?>
            <?php if($data_topik->tmc_status == 0)
            {
              echo '<label class="label label-success pull-right" style="font-size:14px;">Aktif</label>';
            }else{
              echo '<label class="label label-warning pull-right" style="font-size:14px;">Selesai</label>';
            } ?>
          </h3>
            <div class="col-xs-12" style="background-color: #FFF;padding: 15px;border-radius: 3px;margin-bottom: 1%;min-height: 75vh; max-height: 75vh; overflow-x: scroll;" id="tempat_chat">
              
            </div>
          <div class="col-xs-12" style="padding-left: 0px;padding-right: 0px;">
                <div class="input-group">
                <input type="text" name="message" id="text_pesan" placeholder="Ketikan Pesan ..." class="form-control">
                <input type="hidden" name="id_user" id="id_user" value="<?php echo $this->session->userdata('user_id');?>">
                <input type="hidden" name="tc_id" id="tc_id" value="<?php echo $this->uri->segment(3);?>">
                <span class="input-group-btn">
                  <button type="button" class="btn btn-danger btn-flat btn-primary" style="background-color: #05728F;" onclick="send_chat()"><i class="fa fa-location-arrow"></i>Send</button>
                </span>
              </div>
          </div>
          </div>
        </div>
      </section>
      <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->

  <script type="text/javascript">
    $("#hidesidebar").addClass("sidebar-collapse");
  var tc_id = "<?php echo $this->uri->segment(3);?>";
  $("#text_pesan").on('keypress', function(e){
    if(e.which == 13)
    {
      send_chat();
    }
  });

  $( document ).ready(function() {
    get_chat(tc_id,1);
    bawah();
    $("#text_pesan").focus();
    setInterval(function(){ get_chat(tc_id); }, 3000);
  });
  
  function get_chat(tc_id,aks=0)
  {
    var base_url = "<?php echo base_url();?>";
    $.ajax({
        url:  base_url+"<?php echo $this->uri->segment(1); ?>/get_chat/"+tc_id,
        success: function (data){
          $("#tempat_chat").empty();
          $("#tempat_chat").html(data);
          if(aks == 1)
          {
            bawah();
          }
        }
    });
  }

  function send_chat()
  {
    var text_pesan = $("#text_pesan").val();
    var id_user = $("#id_user").val();
    var tc_id = $("#tc_id").val();
    var base_url = "<?php echo base_url();?>";

    $.ajax({
        type: "POST",
        url:  base_url+"<?php echo $this->uri->segment(1); ?>/save_chat",
        data: {
          'text_pesan' : text_pesan,
          'id_user' : id_user,
          'tc_id' : tc_id
        },
        success: function (data){
            get_chat(tc_id,1);
            $("#text_pesan").val('');
        }
    });
  }

  function bawah()
  {
    $('#tempat_chat').scrollTop($('#tempat_chat')[0].scrollHeight);
  }
  </script>