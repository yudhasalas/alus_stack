    <?php 
    if(empty($data_chat->result()))
    {
      echo '<div class="col-xs-12">Ayo mulai chat dengan menyapa/menyampaikan keluhan anda !</div>';
    }
              foreach ($data_chat->result() as $value_data) { 
                $this->db->where('id', $value_data->tcd_from_user_id);
                $dt_user=$this->db->get('alus_u')->row();
              ?>
            <div class="col-xs-12" style="padding: 0px;">
              <?php if($value_data->tcd_from_user_id == $this->session->userdata('user_id'))
              {
                /*KANAN*/ 
              ?>
            <div class="outgoing_msg">
              <div class="sent_msg">
                <p>
                  <?php echo $value_data->tcd_text;?>
                </p>
                <span class="time_date"><?php echo date('d F h:i', strtotime($value_data->tcd_datetime));?></span> </div>
              </div>
              <?php }else{
                /*KIRI*/
              ?>
              <div class="incoming_msg">
              <div class="incoming_msg_img" style="border-radius: 50%;">
                <img src="<?php echo $this->config->item('base_url_assets')."/assets/avatar/".$dt_user->picture;?>" alt="" style="border-radius: 50%;">
              </div>
              <div class="received_msg">
                <span><b><?php echo $dt_user->first_name." ".$dt_user->last_name;?></b></span>
                <div class="received_withd_msg">
                  <p>
                  <?php echo $value_data->tcd_text;?>
                  </p>
                  <span class="time_date"><?php echo date('d F h:i', strtotime($value_data->tcd_datetime));?></span>
                </div>
              </div>
              </div>
              <?php }?>
            </div>
            <?php } ?>