<?php  if ( ! defined('BASEPATH')) exit('No direct script access allowed');

/*Created by Maulana Rahman designed for Warung Sadulur :)*/
/**
 * @author      Maulana Rahman <maulana.code@gmail.com>
*/

require './vendor/autoload.php';
use Minishlink\WebPush\WebPush;
use Minishlink\WebPush\Subscription;



class Push_notif
{
	private $CI;

	public function __construct()
    {
            // Assign the CodeIgniter super-object
            $this->CI =& get_instance();
    }

	function push($id_login=null, $judul='', $body='', $url='https://hppx.alus.co/sadulur')
    {
        /*GET END POINT USER*/
        $this->CI->db->where('tue_id_login', $id_login);
        $data_end = $this->CI->db->get('t_user_endpoint', 1, 0);
        if($data_end->num_rows() <= 0)
        {
        	return FALSE;
        }else{
        	$value = $data_end->row();
        	$x = json_decode($value->tue_endpoint);
	        $subscription = Subscription::create(json_decode(json_encode($x), true));
	        $auth = array(
	            'VAPID' => array(
	            'subject' => 'https://hppx.alus.co/sadulur',
	            'publicKey' => 'BPtQ4R98rz826XFRBgcQXvGaKVocrGCY5tHw6IjUbN_ViyDFVPDs7uF7MJ53xasHhanWY-aX5orccImwNS7RwQM',
	            'privateKey' => 'EX-2L_SwjgWwFi-8xpYNZ3qgXtT-EOuyMLqWPaVm9WI',
	            ),
	        );

	        $webPush = new WebPush($auth);
	        $res = $webPush->sendNotification(
	            $subscription,
	            '{ "name":"'.$judul.' \n '.$body.'", "url":"'.$url.'"}'
	        );

	        // handle eventual errors here, and remove the subscription from your server if it is expired
	        foreach ($webPush->flush() as $report) {
	            $endpoint = $report->getRequest()->getUri()->__toString();

	            if ($report->isSuccess()) {
	            	/*END POINT AKTIF*/
	                return TRUE;
	            } else {
	            	/*END POINT SUDAH KADALUARSA*/
	                return FALSE;
	            }
	         }	
        }
    }

    function push_all($judul='', $body='', $url='https://hppx.alus.co/sadulur')
    {
        /*GET END POINT USER*/
        foreach ($this->CI->db->get('t_user_endpoint')->result() as $value) {

    	$x = json_decode($value->tue_endpoint);
        $subscription = Subscription::create(json_decode(json_encode($x), true));
        $auth = array(
            'VAPID' => array(
            'subject' => 'https://hppx.alus.co/sadulur',
            'publicKey' => 'BPtQ4R98rz826XFRBgcQXvGaKVocrGCY5tHw6IjUbN_ViyDFVPDs7uF7MJ53xasHhanWY-aX5orccImwNS7RwQM',
            'privateKey' => 'EX-2L_SwjgWwFi-8xpYNZ3qgXtT-EOuyMLqWPaVm9WI',
            ),
        );

        $webPush = new WebPush($auth);
        $res = $webPush->sendNotification(
            $subscription,
            '{ "name":"'.$judul.' \n '.$body.'", "url":"'.$url.'"}'
        );

        // handle eventual errors here, and remove the subscription from your server if it is expired
        foreach ($webPush->flush() as $report) {
            $endpoint = $report->getRequest()->getUri()->__toString();

            if ($report->isSuccess()) {
            	/*END POINT AKTIF*/
                return TRUE;
            } else {
            	/*END POINT SUDAH KADALUARSA*/
                return FALSE;
            }
          }
        }	
    }
}

?>