<?php
require_once '../config.php';
class Login extends DBConnection
{
	private $settings;
	public function __construct()
	{
		global $_settings;
		$this->settings = $_settings;

		parent::__construct();
		ini_set('display_error', 1);
	}
	public function __destruct()
	{
		parent::__destruct();
	}
	public function index()
	{
		echo "<h1>Access Denied</h1> <a href='" . base_url . "'>Go Back.</a>";
	}
	public function login()
	{
		extract($_POST);

		$qry = $this->conn->query("SELECT * from users where username = '$username' and password = md5('$password') ");
		if ($qry->num_rows > 0) {
			foreach ($qry->fetch_array() as $k => $v) {
				if (!is_numeric($k) && $k != 'password') {
					$this->settings->set_userdata($k, $v);
				}
			}
			$this->settings->set_userdata('login_type', 1);
			return json_encode(array('status' => 'success'));
		} else {
			return json_encode(array('status' => 'incorrect', 'last_qry' => "SELECT * from users where username = '$username' and password = md5('$password') "));
		}
	}
	public function logout()
	{
		if ($this->settings->sess_des()) {
			redirect('admin/login.php');
		}
	}

	public function register()
{
    extract($_POST);

    // Check if password matches confirm password
    if ($reg_pass !== $confirm_reg_pass) {
        return json_encode(array('status' => 'failed', 'error' => 'Password and confirm password do not match'));
    }

    // Check if username already exists
    $check_username_query = "SELECT COUNT(*) as count FROM users WHERE username = '$username'";
    $check_username_result = $this->conn->query($check_username_query);
    $username_exists = $check_username_result->fetch_assoc()['count'];
    if ($username_exists > 0) {
        return json_encode(array('status' => 'failed', 'error' => 'Username already exists'));
    }

    $firstname = ""; 
    $lastname = ""; 

    
    $query = "INSERT INTO users (firstname, lastname, username, password) 
              VALUES ('$firstname', '$lastname', '$username', MD5('$reg_pass'))";
    if ($this->conn->query($query)) {
        // Registration successful
        return json_encode(array('status' => 'success'));
    } else {
        // Registration failed
        return json_encode(array('status' => 'failed', 'error' => $this->conn->error));
    }
}


	function login_user()
	{
		extract($_POST);
		$qry = $this->conn->query("SELECT * from clients where email = '$email' and password = md5('$password') ");
		if ($qry->num_rows > 0) {
			foreach ($qry->fetch_array() as $k => $v) {
				$this->settings->set_userdata($k, $v);
			}
			$this->settings->set_userdata('login_type', 1);
			$resp['status'] = 'success';
		} else {
			$resp['status'] = 'incorrect';
		}
		if ($this->conn->error) {
			$resp['status'] = 'failed';
			$resp['_error'] = $this->conn->error;
		}
		return json_encode($resp);
	}
}
$action = !isset($_GET['f']) ? 'none' : strtolower($_GET['f']);
$auth = new Login();
switch ($action) {
	case 'login':
		echo $auth->login();
		break;
	case 'login_user':
		echo $auth->login_user();
		break;
	case 'logout':
		echo $auth->logout();
		break;
	case 'register': // Added case for registration
		echo $auth->register();
		break;
	default:
		echo $auth->index();
		break;
}
