        <div class="footer"></div>
    <script>
        var _root_ = "<?php echo Config::get('URL');  ?>";
    </script>
	<script src="<?php echo Config::get('URL'); ?>assets/js/jquery.min.js"></script>
	<script src="<?php echo Config::get('URL'); ?>assets/js/bootstrap.min.js"></script>
	<script src="<?php echo Config::get('URL'); ?>assets/js/ripples.min.js"></script>
	<script src="<?php echo Config::get('URL'); ?>assets/js/material.min.js"></script>
	<script src="<?php echo Config::get('URL'); ?>assets/js/datepicker.js"></script>
    <script src="<?php echo Config::get('URL'); ?>assets/js/bootstrap-timepicker.min.js"></script>
	<script src="<?php echo Config::get('URL'); ?>assets/js/fileinput.min.js"></script>
	<script src="<?php echo Config::get('URL'); ?>assets/js/jquery.slimscroll.min.js"></script>
    <script src="<?php echo Config::get('URL'); ?>assets/js/main.js"></script>
	<!-- <script src="<?php echo Config::get('URL'); ?>assets/js/jquery-printme.js"></script> -->
	<?php //custom Js
        if(Registry::has('js')){
            Registry::get('js');
        }
    ?>
	<script>
		$(function () {
		    $.material.init();
	    });
	</script>
</body>
</html>