<h1>Please Login</h1>
		
		<?php echo form_open('ib/main/authenticate');?>
		<table>
			<tr>
				<td>User ID:</td>
				<td><input type="text" name="userid" value="demo" size="13" maxlength="13"></td>
			</tr>
			<tr>
				<td>Password:</td>
				<td><input type="password" name="password" size="10" maxlength="10" value="password"></td>
			</tr>
			<tr>
				<td></td>
				<td><input type="submit" name="login" value="Login"></td>
			</tr>
		</table>
		<?php echo form_close(); ?>
		<hr>
<!-- (c)Copyright 2009, CommunityBanker.org -->
