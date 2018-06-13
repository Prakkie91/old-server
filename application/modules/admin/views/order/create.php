<?php echo $form->messages(); ?>

<div class="row">
    <?php echo $form->open(); ?>

    <div class="col-md-12">
        <div class="box box-primary">
            <div class="box-header">
                <h3 class="box-title">Create Order</h3>
            </div>
            <div class="box-body">
                <div class="col-md-4">
                    <div class="form-group">
                        <label>Car Type</label>
                        <select class="form-control select2" name="car_type" id="car_type" style="width: 100%;">
                            <?php foreach ($car_type_array as $c_type): ?>
                                <option><?php echo $c_type->type; ?></option>
                            <?php endforeach; ?>
                        </select>
                    </div>

                    <?php echo $form->bs3_text('Ad Theme', 'ad_theme'); ?>

                    <div class="form-group">
                        <label>Ad Type</label>
                        <select class="form-control select2" name="ad_type" id="ad_type" style="width: 100%;">
                            <?php foreach ($ad_type_array as $a_type): ?>
                                <option><?php echo $a_type->type; ?></option>
                            <?php endforeach; ?>
                        </select>
                    </div>

                    <label>Ad Size</label>
                    <div class="input-group form-group">
                        <input type="text" class="form-control" name="ad_size" id="ad_size"
                               placeholder="10 x 3, 5 x 4, etc">
                        <span class="input-group-addon">m x m</span>
                    </div>

                    <!-- Date range -->
                    <div class="form-group">
                        <label>Ad Period</label>

                        <div class="input-group">
                            <div class="input-group-addon">
                                <i class="fa fa-calendar"></i>
                            </div>
                            <input type="text" class="form-control pull-right" id="ad_period" name="ad_period">
                        </div>
                        <!-- /.input group -->
                    </div>
                    <!-- /.form group -->

                    <label>Amount</label>
                    <div class="input-group form-group">
                        <input type="text" class="form-control" name="amount" id="amount">
                        <span class="input-group-addon">HKD</span>
                    </div>
                </div>

                <!-- Ad region and radius part -->
                <div class="col-md-8">
                    <div class="col-md-12"><label>Ad Regions and Radius</label></div>

                    <div id="ad_region_add_area">
                        <!-- One Ad area start -->
                        <div class="col-md-8">
                            <!-- place picker -->
                            <div class="form-group">
                                <div class="form-group">
                                    <input id="advanced-placepicker" class="form-control"
                                           data-map-container-id="collapseTwo"
                                           name="ad_region" id="ad_region" style="width: 100%;"/>

                                    <input type="hidden" id="latitude" name="latitude" value=""/>
                                    <input type="hidden" id="longitude" name="longitude" value=""/>
                                </div>

                                <div id="collapseTwo" class="collapse">
                                    <div class="another-map-class thumbnail"></div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-2">
                            <div class="input-group">
                                <input type="text" class="form-control" name="radius" id="radius">
                                <span class="input-group-addon">Km</span>
                            </div>
                        </div>
                        <div class="col-md-2">
                            <button class="btn btn-block btn-primary" type="button" id="add_btn">Add</button>
                        </div>
                        <!-- End -->
                    </div>

                    <div class="form-group col-md-12">
                        <input type="hidden" id="ad_info" name="ad_info" value="" style="width: 100%"/>
                        <ul id="ad_region_container">
                            <!-- Ad region text list -->
                        </ul>
                    </div>
                </div>

                <div class="col-md-12" style="margin-top: 30px;">
                    <button class="btn btn-block btn-primary btn-lg" type="submit">Submit</button>
                </div>
            </div>
        </div>
    </div>
    <?php echo $form->close(); ?>

</div>

<link rel="stylesheet" href="<?php echo base_url() ?>assets/dist/select2.min.css">
<script src="<?php echo base_url() ?>assets/dist/select2.full.min.js"></script>
<!-- daterange picker -->
<link rel="stylesheet" href="<?php echo base_url() ?>assets/dist/daterangepicker.css">
<!-- bootstrap datepicker -->
<link rel="stylesheet" href="<?php echo base_url() ?>assets/dist/bootstrap-datepicker.min.css">

<!-- InputMask -->
<script src="<?php echo base_url() ?>assets/dist/jquery.inputmask.js"></script>
<script src="<?php echo base_url() ?>assets/dist/jquery.inputmask.date.extensions.js"></script>
<script src="<?php echo base_url() ?>assets/dist/jquery.inputmask.extensions.js"></script>
<!-- date-range-picker -->
<script src="<?php echo base_url() ?>assets/dist/moment.min.js"></script>
<script src="<?php echo base_url() ?>assets/dist/daterangepicker.js"></script>
<!-- bootstrap datepicker -->
<script src="<?php echo base_url() ?>assets/dist/bootstrap-datepicker.min.js"></script>
<!-- jquery placepicker -->
<script src="<?php echo base_url() ?>assets/dist/jquery.placepicker.js"></script>


<script src="http://netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js"></script>
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css" rel="stylesheet">
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap-theme.min.css" rel="stylesheet">

<script type="text/javascript"
        src="https://maps.googleapis.com/maps/api/js?key=AIzaSyA3Lf_RKrQdUAiIVZ7422NDKZcL0Tdf8ZM&sensor=true&libraries=places">
</script>

<style>
    .another-map-class {
        width: 100%;
        height: 300px;
    }
</style>

<script>
    $(function () {

        var addresses = [];
        var lats = [];
        var lngs = [];
        var radiuses = [];
        var curAddress = '';
        var curLat = '';
        var curLng = '';

        var adInfos = [];

        // place picker
        // Advanced usage
        $("#advanced-placepicker").each(function () {
            var $collapse = $(this).parents('.form-group').next('.collapse');
            var $map = $collapse.find('.another-map-class');

            //initMap();

            var placepicker = $(this).placepicker({
                map: $map.get(0),
                placeChanged: function (place) {
                    console.log("place changed: ", place.formatted_address, this.getLocation());
                    $('#latitude').val(this.getLocation().latitude);
                    $('#longitude').val(this.getLocation().longitude);

                    curAddress = place.name;
                    curLat = this.getLocation().latitude;
                    curLng = this.getLocation().longitude;
                }
            }).data('placepicker');
        });

        //$('#collapseTwo').addClass('in');

        //$('.select2').select2();

        //Date picker
        $('#datepicker1').datepicker({
            autoclose: true
        });

        //Date picker
        $('#datepicker2').datepicker({
            autoclose: true
        });

        //Date range picker
        $('#ad_period').daterangepicker();
        //$('#datemask').inputmask('dd/mm/yyyy', { 'placeholder': 'dd/mm/yyyy' })
        //$('#ad_period').inputmask('Y-m-d', { 'placeholder': 'yyyy-MM-dd' })

        var count = 0;
        $('.del_right_div').live('click', function () {
            var eid = $(this).attr('id');
            var suffixid = eid.substring(3, eid.length);
            var removeid = '#ad_region_label' + suffixid;
            $(removeid).remove();

            addresses.splice(suffixid-1, 1, "");
            lats.splice(suffixid-1, 1, "");
            lngs.splice(suffixid-1, 1, "");
            radiuses.splice(suffixid-1, 1, "");

            adInfos = [];
            for(var i=0;i<addresses.length;i++) {
                if(addresses[i]!=""){
                    var adinfo = {
                        address: addresses[i],
                        lat: lats[i],
                        lng: lngs[i],
                        radius: radiuses[i]
                    };
                    adInfos.push(adinfo);
                }
            }

            if (adInfos.length > 0) {
                $('#ad_info').val(JSON.stringify(adInfos));
            } else {
                $('#ad_info').val("");
            }
        });

        $('#add_btn').on('click', function () {
            var address = $('#advanced-placepicker').val();
            var radius = $('#radius').val();
            if (address && radius) {
                count++;
                var ad_text = address + ' (' + radius + ' Km)';
                var html = "<li id='ad_region_label" + count + "'>" +
                    "<div style='height: 5px'>" +
                    "<div class='pull-right btn-box-tool del_right_div' id='del" + count + "'>" +
                    "<i class='fa fa-times'></i>" +
                    "</div></div>" +
                    "<p>" + ad_text + "</p>" +
                    "</li>";

                $('#ad_region_container').append(html);

                addresses.push(curAddress);
                lats.push(curLat);
                lngs.push(curLng);
                radiuses.push(radius);

                var adinfo = {
                    address: curAddress,
                    lat: curLat,
                    lng: curLng,
                    radius: radius
                };

                adInfos.push(adinfo);
                if (adInfos.length > 0) {
                    $('#ad_info').val(JSON.stringify(adInfos));
                }

                $('#advanced-placepicker').val('');
                $('#radius').val('')
            }
        });
    });
</script>

