<?php
defined('BASEPATH') OR exit('No direct script access allowed');

/**
 * @author      Maulana Rahman <maulana.code@gmail.com>
*/

class Chat extends CI_Controller {
	
	

	public function __construct()
	{	
		parent::__construct();
		$this->load->model('Model_chat','Alus_items');
	}

	public function index()
	{
		if($this->alus_auth->logged_in())
         {
         	$title_head = "Konsultasi";
         	$head['title'] = $title_head;
         	$data['title_head'] = $title_head;

         	/*DATA*/

         	/*END DATA*/

		 	$this->load->view('template/temaalus/header',$head);
		 	$this->load->view('index',$data);
		 	$this->load->view('template/temaalus/footer');
		}else
		{
			redirect('panel_login/login','refresh');
		}
	}


	/*AJAX LIST*/

	public function ajax_list()
    {   
        $list = $this->Alus_items->get_datatables();
        $data = array();
        $no = $_POST['start'];
        foreach ($list as $person) {
            $no++;
            $row = array();
            $row[] = $person->tmc_judul;
            $row[] = "<i>".$person->first_name."</i>";
            $row[] = "<b>".$person->td_name."</b>";
            $row[] = date('d-m-Y H:i',strtotime($person->tmc_created));
            if($person->tmc_status == '0'){
            	$row[] = "<b style='color:#3C8DBC;'>Aktif</b>";
            }else{
            	$row[] = "<b style='color:#00A65A;'>Selesai</b>";
            }
        	
            if($person->tmc_status == '1')
            {
                $row[] = "<div class='btn-group-vertical btn-xs'><a href='".base_url('chat/detail/').$person->tmc_id."' data-toggle='tooltip' data-placement='bottom' title='Buka Konsultasi' class='btn btn-xs btn-flat btn-primary' style='background:#00897b'><i class='fa fa-comments-o'></i> Buka Konsultasi</a>"."<a href='javascript:' onClick='btn_modal_pindah(".$person->tmc_id.")' data-toggle='tooltip' data-placement='bottom' title='Pindah Kategori' class='btn btn-xs btn-flat bg-maroon'><i class='fa fa-check-square'></i> Pindah Kategori</a></div>";
            }else{
                $row[] = "<div class='btn-group-vertical btn-xs'><a href='".base_url('chat/detail/').$person->tmc_id."' data-toggle='tooltip' data-placement='bottom' title='Buka Konsultasi' class='btn btn-xs btn-flat btn-primary' style='background:#00897b'><i class='fa fa-comments-o'></i> Buka Konsultasi</a>"."<a href='javascript:' onClick='btn_modal_pindah(".$person->tmc_id.")' data-toggle='tooltip' data-placement='bottom' title='Pindah Kategori' class='btn btn-xs btn-flat bg-maroon'><i class='fa fa-check-square'></i> Pindah Kategori</a>"."<a href='javascript:' onClick='btn_modal_delete(".$person->tmc_id.")' data-toggle='tooltip' data-placement='bottom' title='Tandai Selesai' class='btn btn-xs btn-flat btn-success'><i class='fa fa-check-square-o'></i> Tandai Selesai</a></div>";
            }
            //add html for action
            $data[] = $row;
        }
 
        $output = array(
                        "draw" => $_POST['draw'],
                        "recordsTotal" => $this->Alus_items->count_all(),
                        "recordsFiltered" => $this->Alus_items->count_filtered(),
                        "data" => $data,
                );
        //output to json format
        echo json_encode($output);
    }

    function detail($tc_id)
	{
		$this->db->where('tcd_tc_id', $tc_id);
		$data['data'] = $this->db->get('t_conversations_details');
		$head['title'] = "Chat";

		$this->db->where('tmc_id', $tc_id);
		$data['data_topik'] = $this->db->get('t_m_chat', 1, 0)->row();
		$this->load->view('template/temaalus/header',$head);
		$this->load->view('chat/detail',$data);
	}

	function save_chat()
    {
        $data= array(
                'tcd_tc_id' => $this->input->post('tc_id'),
                'tcd_from_user_id' => $this->input->post('id_user'),
                'tcd_text' => $this->input->post('text_pesan')
            );
        $this->db->insert('t_conversations_details', $data);

        /*Prepare untuk push notifikasi*/
        $this->db->where('tmc_id', $this->input->post('tc_id'));
        $data_tc = $this->db->get('t_m_chat')->row();

        if($data_tc->tmc_user_id == $this->input->post('id_user'))
        {
            /*ambil data pengirim notif*/
            $this->db->where('id', $this->input->post('id_user'));
            $data_pengirim = $this->db->get('alus_u')->row();
            /*end*/

            /*maka penerima notifnya adalah konsultan*/

            /*Ambil data konsultannya*/
            $this->db->where('name', $data_tc->tmc_kategori);
            $this->db->join('alus_ug', 'alus_g.id = alus_ug.group_id', 'left');
            $data_user = $this->db->get('alus_g')->result();
            /*end ambil data pengirim chat*/

            foreach ($data_user as $value) {
                $this->push_notif->push($value->user_id,'Pesan Konsultasi dari '.$data_pengirim->first_name, $this->input->post('text_pesan') , 'https://hppx.alus.co/polinggaul/detail_chat/'.$this->input->post('tc_id'));
            }
        }else{

            /*Ambil data pengirim chat disini berarti user biasa*/
            /*ambil data pengirim notif*/
            $this->db->where('id', $this->input->post('id_user'));
            $data_pengirim = $this->db->get('alus_u')->row();
            /*end*/

            $this->push_notif->push($data_tc->tmc_user_id,'Balasan dari Konsultan '.$data_pengirim->first_name, $this->input->post('text_pesan') , 'https://hppx.alus.co/polinggaul/detail_chat/'.$this->input->post('tc_id'));
        }
        /*end*/
        return true;
    }


    function pindah()
    {
        $data = array('tmc_kategori' => $this->input->post('kategori', TRUE));

        $this->db->where('tmc_id', $this->input->post('tmc_id', TRUE));
        $this->db->update('t_m_chat', $data);
        echo json_encode(array('status' => TRUE));
    }

	function get_chat($tc_id)
	{
		$this->db->where('tcd_tc_id', $this->uri->segment(3));
        $this->db->order_by('tcd_datetime', 'asc');
        $this->db->limit(30);
        $data['data_chat'] = $this->db->get('t_conversations_details');

        /*jad sudah terbaca*/
        $dx = array('tcd_status_baca' => 1);
		$this->db->where('tcd_tc_id', $this->uri->segment(3));
		$this->db->where('tcd_from_user_id != ', $this->session->userdata('user_id'));
		$this->db->update('t_conversations_details', $dx);
        /*end*/

        $this->load->view('source_chat', $data);
	}

    function delete($id)
    {   
        $data = array('tmc_status' => 1 );
        $this->db->where('tmc_id', $id);
        $q = $this->db->update('t_m_chat', $data);

        if($q)
        {
            echo "Terhapus";
        }
        else
        {
            echo "Tidak Terhapus";
        }
    }

    function modal_pindah($id)
    {
        $data['data'] = $this->db->get('t_dinas');
        $data['data_id'] = $this->db->where('tmc_id', $id)->get('t_m_chat')->row();
        $data['title'] = "Pindah Kategori";
        $this->load->view('ajax/modal_edit', $data, FALSE);
    }

}

/* Location: ./application/modules/X/controllers/X.php */
/* End of file X.php */