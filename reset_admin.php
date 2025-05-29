<?php
require_once 'app/config/database.php';
require_once 'app/models/BaseModel.php';
require_once 'app/models/User.php';

use App\Models\User;

$user = new User();
$adminUser = $user->findByUsername('admin');

if ($adminUser) {
    // Reset password to 'admin123'
    $result = $user->updatePassword($adminUser['user_id'], 'admin123');
    echo $result ? "Admin password reset successfully to 'admin123'" : "Failed to reset password";
} else {
    // Create admin user if it doesn't exist
    $data = [
        'username' => 'admin',
        'password' => 'admin123',
        'full_name' => 'Administrator',
        'role_id' => 1,
        'is_active' => 1
    ];
    $result = $user->createUser($data);
    echo $result ? "Admin user created successfully with password 'admin123'" : "Failed to create admin user";
} 