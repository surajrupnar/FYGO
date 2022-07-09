<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="false"%>
<div class="section" align="left">
	<!-- container -->
	<div class="container">
		<!-- row -->
		<div class="row">

			<div class="col-md-5">
				<!-- Billing Details -->
				<div class="billing-details">
					<div class="section-title">
						<h3 class="title">CSR
							REGISTRATION</h3>
					</div>
					<div>
						<table style="width: 100%; border: 1px;">
							<tr>
								<td>First Name</td>
								<td><input type="text"></td>
							</tr>
							<tr>
								<td>Last Name</td>
								<td><input type="text"></td>
							</tr>
							<tr>
								<td>Date Of Birth</td>
								<td><input type="text"></td>
							</tr>
							<tr>
								<td>Gender</td>
								<td><input type="text"></td>
							</tr>
							<tr>
								<td>Contact Number</td>
								<td><input type="text"></td>
							</tr>
							<tr>
								<td>Alternate Contact Number</td>
								<td><input type="text"></td>
							</tr>
							<tr>
								<td>Email Address</td>
								<td><input type="text"></td>
							</tr>
							<tr>
								<td>Alternate Email Address</td>
								<td><input type="text"></td>
							</tr>
							<tr>
								<td>Emergency Contact Person Name</td>
								<td><input type="text"></td>
							</tr>
							<tr>
								<td>Emergency Contact Person Number</td>
								<td><input type="text"></td>
							</tr>
							<tr>
								<td>Experience</td>
								<td><input type="text"></td>
							</tr>
							<tr>
								<td>Qualification</td>
								<td><input type="text"></td>
							</tr>
							<tr>
								<td></td>
								<td align="right"><button type="submit" value="edit">
										<a href="http://localhost:8800/admin/csr-registration.console">edit</a>
									</button></td>
							</tr>
						</table>
						<h4>Current Address Details</h4>
					</div>
					<div class="form-group">
						<label for="primaryAddressLine1">Address line1</label> <input
							class="input" type="text" name="primaryAddressLine1"
							placeholder="Address line1">
					</div>
					<div class="form-group">
						<label for="primaryAddressLine2">Address line2</label> <input
							class="input" type="text" name="primaryAddressLine2"
							placeholder="Address line2">
					</div>
					<div class="form-group">
						<label for="primaryCountry">Country</label> <select class="input"
							name="primaryCity">
							<option></option>
							<option></option>
						</select>
					</div>
					<div class="form-group">
						<label for="primaryState">State</label> <select class="input"
							name="primaryCity">
							<option></option>
							<option></option>
						</select>
					</div>
					<div class="form-group">
						<label for="primaryCity">City</label> <select class="input"
							name="primaryCity">
							<option></option>
							<option></option>
						</select>
					</div>


					<div class="form-group">
						<label for="primaryZip">ZIP Code</label> <input class="input"
							type="text" name="primaryZip" placeholder="ZIP Code">
					</div>

					<div class="form-group">
						<div class="input-checkbox">
							<input type="checkbox" id="create-account"> <label
								for="create-account"> Is Current Address not same as
								Permanent Addess </label>
							<div class="caption">
								<h4>Permanent Address Details</h4>
								<div class="form-group">
									<label for="primaryAddressLine1">Address line1</label> <input
										class="input" type="text" name="primaryAddressLine1"
										placeholder="Address line1">
								</div>
								<div class="form-group">
									<label for="primaryAddressLine2">Address line2</label> <input
										class="input" type="text" name="primaryAddressLine2"
										placeholder="Address line2">
								</div>
								<div class="form-group">
									<label for="primaryCountry">Country</label> <select
										class="input" name="primaryCity">
										<option></option>
										<option></option>
									</select>
								</div>
								<div class="form-group">
									<label for="primaryState">State</label> <select class="input"
										name="primaryCity">
										<option></option>
										<option></option>
									</select>
								</div>
								<div class="form-group">
									<label for="primaryCity">City</label> <select class="input"
										name="primaryCity">
										<option></option>
										<option></option>
									</select>
								</div>
								<div class="form-group">
									<label for="primaryZip">ZIP Code</label> <input class="input"
										type="text" name="primaryZip" placeholder="ZIP Code">
								</div>


							</div>
						</div>
					</div>



					<div align="right">
						<a href="http://localhost:8800/admin/admin-dashboard.console"
							class="primary-btn order-submit">cancel</a> <a href="#"
							class="primary-btn order-submit">register</a>
					</div>
				</div>

				<!-- /Billing Details -->
			</div>
		</div>
		<!-- class="primary-btn order-submit"-->
	</div>
	<!-- /container -->
</div>