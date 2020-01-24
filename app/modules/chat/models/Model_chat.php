<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Model_chat extends CI_Model {

	var $table = 't_m_chat';
    var $idtable = 'tmc_id';
    var $column_order = array('tmc_judul','first_name','tmc_kategori','tmc_created','tmc_status');
    var $column_search = array(
            'tmc_judul','tmc_kategori','tmc_created','tmc_status','first_name'
        );
    var $order = array('tmc_created' => 'DESC');

    /* Server Side Data */
	/* Modified by : Maulana.code@gmail.com */
    private function _get_datatables_query()
    {   
        $grup = $this->alus_auth->get_users_groups($this->session->userdata('user_id'));
              $i = 1;
              foreach ($grup->result() as $value) {
                if($value->name == "admin")
                {

                }else{
                  if($i == 1)
                  {
                    $this->db->where('tmc_kategori', $value->name);
                  }else{
                    $this->db->or_where('tmc_kategori', $value->name);
                  }
                  $i++;
                }
              }
        $this->db->from($this->table);
        $this->db->join('t_dinas', 't_m_chat.tmc_kategori = t_dinas.td_code', 'left');
        $this->db->join('alus_u', 't_m_chat.tmc_user_id = alus_u.id', 'left');
        $this->db->group_by('tmc_id');
        $i = 0;
     
        foreach ($this->column_search as $item) // loop column 
        {
            if($_POST['search']['value']) // if datatable send POST for search
            {
                 
                if($i===0) // first loop
                {
                    $this->db->group_start(); // open bracket. query Where with OR clause better with bracket. because maybe can combine with other WHERE with AND.
                    $this->db->like($item, $_POST['search']['value']);
                }
                else
                {
                    $this->db->or_like($item, $_POST['search']['value']);
                }
 
                if(count($this->column_search) - 1 == $i) //last loop
                    $this->db->group_end(); //close bracket
            }
            $i++;
        }

        if( !empty($this->input->post('filter_status') || $this->input->post('filter_status') != ""))
        {
            $this->db->where('tmc_status', $this->input->post('filter_status', TRUE));
        }

        if(isset($_POST['order'])) // here order processing
        {
            $this->db->order_by($this->column_order[$_POST['order']['0']['column']], $_POST['order']['0']['dir']);
        } 
        else if(isset($this->order))
        {
            $order = $this->order;
            $this->db->order_by(key($order), $order[key($order)]);
        }
    }
 
    function get_datatables()
    {
        $this->_get_datatables_query();
        if($_POST['length'] != -1)
        $this->db->limit($_POST['length'], $_POST['start']);
        $query = $this->db->get();
        return $query->result();
    }
 
    function count_filtered()
    {
        $this->_get_datatables_query();
        $query = $this->db->get();
        return $query->num_rows();
    }
 
    public function count_all()
    {
        $this->db->from($this->table);
        return $this->db->count_all_results();
    }

    /* end server side  */

    function getid($id)
    {
        $this->db->where($this->idtable, $id);
        return $this->db->get($this->table)->result();
    }

    function save($data)
    {
        return $this->db->insert($this->table, $data);
    }

    function edit($data)
    {
        $this->db->where($this->idtable, $this->input->post($this->idtable));
        return $this->db->update($this->table, $data);
    }

    function delete($id)
    {
        $this->db->where($this->idtable, $id);
        return $this->db->delete($this->table);
    }
}