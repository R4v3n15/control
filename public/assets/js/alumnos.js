var Alumnos = {
    vars : {
        alumnos: []
    },

    initialize: function(){
        console.log('Alumnos Initialize');
        this.getStudents();
        this.defaultGetStudents();
        this.activeData();
        this.checkIfExistTutor();
        this.getLevels();
        this.getClassInfo();
        this.getGroupsByCourse();
        this.checkoutStudent();
        this.displayStudentsCheckout();
    },

    defaultGetStudents: function(){
        let that = this;
        var view = sessionStorage.getItem('st_alive');
        that.displayStudents(view); 
    },

    getStudents: function(){
        let that = this;
        $('.menu_student_list li').on('click', function(){ 
            var activo = $(this).data('group');
            that.displayStudents(activo);
            
        }); 
    },

    displayStudents: function(activo){
        let that = this;
        $.ajax({
            data: { curso :  activo },
            synch: 'true',
            type: 'POST',
            url: _root_ + 'alumno/obtenerAlumnos',
            success: function(data){
                $('#second_head').hide();
                $('#head_menu').show();
                switch(parseInt(activo)) {
                    case 1: $('#club').html(data);
                        break;
                    case 2: $('#primary').html(data); 
                        break;
                    case 3: $('#adolescent').html(data);
                        break;
                    case 4: $('#adult').html(data);
                        break;
                    case 5: $('#penddings').html(data);
                        break;
                    case 6: $('#all_students').html(data);
                        break;
                }
                $.material.init();
                that.selectMultipleStudents(activo);
                that.addStudentInGroup();
                that.changeGroupStudent();
                that.setStudentID();
                that.tables(activo);
                that.getStudentProfile();
                that.changeGroupStudentMultiple();
                that.getInvoiceListStudents();
            }
        });
    },

    getStudentProfile: function() {
        let that = this;
        $('.profile').on('click', function(){
            var curso   = $(this).data('curso'),
                student = $(this).data('student'),
                tutor   = $(this).data('tutor'),
                clase   = $(this).data('clase');
            that.showStudentProfile(curso, student, tutor, clase);
        });
    },

    showStudentProfile: function(curso, student, tutor, clase){
        let that = this;
        $.ajax({
            data: {
                student: student,
                tutor:   tutor,
                clase:   clase
            },
            synch: 'true',
            type: 'POST',
            url: _root_ + 'alumno/obtenerPerfilAlumno',
            success: function(data){
                $('#myTabContent').removeClass('well-content');
                $('#myTabContent').addClass('body-content');
                $('#head_menu').hide();
                $('#second_head').show();
                switch(parseInt(curso)) {
                    case 1: $('#club').html(data);
                        break;
                    case 2: $('#primary').html(data);
                        break;
                    case 3: $('#adolescent').html(data);
                        break;
                    case 4: $('#adult').html(data);
                        break;
                    case 4: $('#penddings').html(data);
                        break;
                    case 6: $('#all_students').html(data);
                        break;
                }

                $('#return_list').click(function(){
                    $('#myTabContent').addClass('well-content');
                    $('#myTabContent').removeClass('body-content');
                    that.displayStudents(curso);
                });
            }
        });
    },




    displayStudentsCheckout: function(){
        let that = this;
        $.ajax({
            synch: 'true',
            type: 'POST',
            url: _root_ + 'alumno/obtenerAlumnosBaja',
            success: function(data){
                $('#checkout_list').html(data);
                $('#tbl_checkout').DataTable();
                that.checkinStudent();
                that.getStudentProfile();
            }
        });
    },

    checkIfExistTutor: function(){
        let that = this;
        $('#nombre_tutor').keydown(function() {
            if ($('#nombre_tutor').val().length >= 2) {
                $.ajax({
                    data: {
                        name: $('#nombre_tutor').val(),
                        surname: $('#apellido_pat').val(),
                        lastname: $('#apellido_mat').val()
                    },
                    synch: 'true',
                    type: 'POST',
                    url: _root_ + 'alumno/existeTutor',
                    success: function(a){
                        if (a !== 'null') {
                            var res = JSON.parse(a);
                            var ask   = '¿Este es el tutor que quiere registrar? <br />';
                            var tutor = ask+res.namet+' '+res.surname1+' '+res.surname2;
                            var btnOk = '<a id="btn_yes" data-tutor="'+res.id_tutor+'" class="btn btn-sm btn-info btn-raised">Si</a> ';
                            var btnNo = ' <a id="btn_not" class="btn btn-sm btn-warning btn-raised">No</a>';
                            
                            $('#exist_tutor').addClass('mini-box');
                            $('#exist_tutor').html('<p class="text-center">'+tutor+'</p>'+btnOk+btnNo);

                            that.useTutor();
                        }
                    }
                });
            } else {
                $('#exist_tutor').html('');
                $('#exist_tutor').removeClass('mini-box');
            }
        });

    },

    useTutor: function(){
        $('#btn_yes').click(function(){
            var tutor = $(this).data('tutor');
        });

        $('#btn_not').click(function(){
            $('#exist_tutor').hide();
            $('#exist_tutor').html('');
            $('#exist_tutor').removeClass('mini-box');
        });
    },

    getLevels: function() {
        $('#course').change(function(){
            var curso = $(this).val();
            if (curso !== '') {
                $.ajax({
                    data: {
                        curso: curso
                    },
                    synch: 'true',
                    type: 'POST',
                    url: _root_ + 'alumno/obtenerNivelesCurso',
                    success: function(a){
                        var option = '<option value="">Seleccione...</option>';
                        if (a !== 'null') {
                            var res = JSON.parse(a);
                            for (var i = 0; i < res.length; i++) {
                                option = option + '<option value="'+res[i].id+'">'+res[i].level+'</option>';
                            }
                        } else {
                            option = '<option value="">Curso sin grupos</option>';
                        }
                        
                        $('#levelList').html(option);
                    }
                });
            }
        });
    },

    //Informacion de la clase->inscribir alumno.
    getClassInfo: function() {
        $('#levelList').change(function(){
            var clase = $(this).val();
            // console.log(clase);
            if (clase !== '') {
                $.ajax({
                    data: { clase: clase },
                    synch: 'true',
                    type: 'POST',
                    url: _root_ + 'alumno/obtenerInfoClase',
                    success: function(a){
                        // console.log(a);
                        if (a !== 'null') {
                            $('#clasedata').addClass('mini-box');
                            var res = JSON.parse(a);
                            $('#clase_id').val(res.id);
                            $('#clase_name').text('Clase: '+res.name+' '+res.level);
                            $('#horario_c').text('Horario: '+res.hour_init+' - '+res.hour_end);
                            $('#f_inicio').text('Inicia: '+res.date_init);
                            $('#f_fin').text('Termina: '+res.date_init);

                            $('#fecha_inicio').val(res.date_init);

                            $.ajax({
                                data: { clase: res.horario },
                                synch: 'true',
                                type: 'POST',
                                url: _root_ + 'alumno/obtenerDiasClase',
                                success: function(data){
                                    // console.log(data);
                                    if (data !== 'null') {
                                        var r = JSON.parse(data);
                                        var day = '';
                                        for (var i = 0; i < r.length; i++) {
                                            day !== '' ? day = day+', '+ r[i].day : day = day + r[i].day;
                                        }
                                        $('#dias').text('Días: '+day);
                                    }
                                }
                            });
                        }
                    }
                });
            }
        });
    },

    getGroupsByCourse: function(){
        let that = this;
        $('#course').on('change', function(){
            if ($(this).val() !== '') {
                $.ajax({
                    data: { curso: $(this).val() },
                    synch: 'true',
                    type: 'POST',
                    url: _root_ + 'alumno/obtenerNivelesCurso',
                    success: function(data){
                        var option = '<option value="">Seleccione...</option>';
                        if (data !== 'null') {
                            var res = JSON.parse(data);
                            for (var i = 0; i < res.length; i++) {
                                option = option + '<option value="'+res[i].id+'">'+res[i].level+'</option>';
                            }
                        } else {
                            option = '<option value="">Curso sin grupos</option>';
                        }
                        
                        $('#groups').html(option);
                    }
                });
            }
        });
    },

    setStudentID: function(){
        let that = this;
        $('.adding_group').on('click', function(){
            var student = $(this).data('student');
            $('#course').val('');
            $('#groups').val('');
            $('#alumno_id').val(student);
        });
    },

    selectMultipleStudents: function(activo){
        $('#select_all_'+activo).change(function(){
            var opt = $("#select_all_"+activo).prop("checked");
            console.log(opt);
            if (opt) {
                $(".check_one").prop("checked", true);
            } else {
                $(".check_one").prop("checked", false);
            }
        });
    },

    changeGroupStudent: function(){
        let that = this;
        $('.change_group').on('click', function(){;
            var student = $(this).data('student'),
                curso   = $(this).data('course'),
                grupo   = $(this).data('group');
            $('#alumno_number').val(student);
            console.log(curso);
            $("#course_list option[value='" + curso +"']").attr("selected", true);
            $("#course_list option[value!='" + curso +"']").attr("selected", false);
            $.ajax({
                data: { curso: curso },
                synch: 'true',
                type: 'POST',
                url: _root_ + 'alumno/obtenerNivelesCurso',
                success: function(data){
                    console.log(data);
                    var option = '';
                    if (data !== 'null') {
                        var res = JSON.parse(data);
                        for (var i = 0; i < res.length; i++) {
                            var attr = res[i].group_id == grupo ? 'selected' : '';
                            option = option + '<option '+attr+' value="'+res[i].class_id+'">'+res[i].group_name+'</option>';
                        }
                    }
                    $('#grupos').html(option);
                }
            });

            $('#change_group').modal('show');
        });

        $('#course_list').on('change', function(){
            if ($(this).val() !== '' && $(this).val() !== '0') {
                $.ajax({
                    data: { curso: $(this).val() },
                    synch: 'true',
                    type: 'POST',
                    url: _root_ + 'alumno/obtenerNivelesCurso',
                    success: function(data){
                        var option = '<option value="">Seleccione...</option>';
                        if (data !== 'null') {
                            var res = JSON.parse(data);
                            for (var i = 0; i < res.length; i++) {
                                option = option + '<option value="'+res[i].class_id+'">'+res[i].group_name+'</option>';
                            }
                        } else {
                            option = '<option value="">Curso sin grupos</option>';
                        }
                        
                        $('#grupos').html(option);
                    }
                });
            } else {
                if ($(this).val() === '0') {
                    $('#grupos').html('<option value="0">En espera</option>');
                }
            }
        });

        $('#do_change_group').on('click', function(){;
            var alumno = $('#alumno_number').val(),
                clase  = $('#grupos').val();

            if (alumno !== '0' && alumno !== '') {
                that.changeStudent(alumno, clase);
            } else if(alumno === '0' && alumno !== '') {
                that.changeStudents(clase);
            }
        });
    },

    changeStudent: function(alumno, clase) {
        let that = this;
        $.ajax({
            data: { alumno: alumno, clase: clase },
            synch: 'true',
            type: 'POST',
            url: _root_ + 'alumno/cambiarGrupoAlumno',
            success: function(data){
                if (data === '1') {
                    $('#general_snack').attr('data-content', 'Reasignación de grupo realizado!');
                    $('#general_snack').snackbar('show');
                    $('.snackbar').addClass('snackbar-blue');
                } else {
                    if (data === '0') {
                        $('#general_snack').attr('data-content', 'Falto información para cambio de grupo!');
                        $('#general_snack').snackbar('show');
                    } else {
                        $('#general_snack').attr('data-content', 'Error desconocido: no se realizó el cambio!');
                        $('#general_snack').snackbar('show');
                        $('.snackbar').addClass('snackbar-red');
                    }
                }

                $('#change_group').modal('hide');
                var view = sessionStorage.getItem('st_alive');
                that.displayStudents(view); 
            }
        });
    },

    changeStudents: function(clase){
        let that = this;
        if (clase !== '') {
            if (that.vars.alumnos.length > 0) {
                var alumnos = that.vars.alumnos;
                $.ajax({
                    data: { alumnos: alumnos, clase: clase },
                    synch: 'true',
                    type: 'POST',
                    url: _root_ + 'alumno/cambiarGrupoAlumnos',
                    success: function(data){
                        if (data === '1') {
                            $('#general_snack').attr('data-content', 'Reasignación de grupo realizado!');
                            $('#general_snack').snackbar('show');
                            $('.snackbar').addClass('snackbar-blue');
                        } else {
                            if (data === '0') {
                                $('#general_snack').attr('data-content', 'Falto información para cambio de grupo!');
                            } else {
                                $('#general_snack').attr('data-content', 'Error desconocido: No se completó la acción!');
                                $('#general_snack').snackbar('show');
                                $('.snackbar').addClass('snackbar-red');
                            }
                        }
                        $('#change_group').modal('hide');
                        var view = sessionStorage.getItem('st_alive');
                        that.displayStudents(view); 
                    }
                });
                that.vars.alumnos = [];
            }
        } else {
            $('#general_snack').attr('data-content', 'Dejó campos vacios!');
            $('#general_snack').snackbar('show');
            $('.snackbar').addClass('snackbar-green');
        }
    },

    changeGroupStudentMultiple: function(){
        let that = this;
        $('.change_multi').click(() => {
            var alumnos = [], j=0;
            $.each($('.check_one'), function(i, item) {
                if ($(this).prop("checked")) {
                    alumnos[j] = $(this).val();
                    j++;
                }
            });

            $("#course_list").val('');
            $("#grupos").val('');

            if (alumnos.length > 0) {
                $('#alumno_number').val(0);
                that.vars.alumnos = alumnos;
                $('#change_group').modal('show');
            } else {
                $('#general_snack').attr('data-content', 'Seleccione al menos a un Alumno!');
                $('#general_snack').snackbar('show');
                $('.snackbar').addClass('snackbar-green');
            }
        });
    },

    addStudentInGroup: function() {
        let that = this;
        $('#add_in_group').on('click', function(){
            var alumno = $('#alumno_id').val(),
                curso  = $('#course').val(),
                clase  = $('#groups').val();
                // console.log(alumno, clase);
            $.ajax({
                data: { alumno: alumno, clase: clase },
                synch: 'true',
                type: 'POST',
                url: _root_ + 'alumno/agregarAlumnoGrupo',
                success: function(data){
                    if (data !== '0') {
                        $('#add_to_group').modal('hide');
                        $('#general_snack').attr('data-content', 'Alumno agregado al grupo correctamente!');
                        that.displayStudents(curso);
                    } else {
                        $('#general_snack').attr('data-content', 'No se agregó el alumno al grupo!');
                        that.displayStudents(curso);
                    }
                    $('#general_snack').snackbar('show');

                    //Verificar en que vista debe mantenerse al usuario
                    var view = sessionStorage.getItem('st_alive');
                    that.displayStudents(view); 
                }
            });
        });
    },

    //Dar de baja al alumno
    checkoutStudent: function() {
        let that = this;
        $('#check_out').change(function(){
            var opt          = $("#check_out").prop("checked"),
                student_id   = $("#check_out").data('id'),
                student_name = $("#check_out").data('name');
            if (opt) {
                $('#alumno_id').val(student_id);
                $('#student_name').text(student_name);
                $('#checkout').modal('show');
            } else {
                $('#id_alumno').val(student_id);
                $('#alumno_name').text(student_name);
                $('#checkin').modal('show');
            }
            console.log(opt);
        });

        $('#checkout_student').click(function(){
            var alumno = $('#alumno_id').val();
            $.ajax({
                data: { alumno: alumno, estado: 1 },
                synch: 'true',
                type: 'POST',
                url: _root_ + 'alumno/bajaAlumno',
                success: function(data){
                    if (data === '1') {
                        $('#student_snack').attr('data-content', 'Alumno dado de BAJA correctamente!');
                    } else {
                        $('#student_snack').attr('data-content', 'No fue posible dar de baja al alumno!');
                    }
                    $('#student_snack').snackbar('show');
                    $('#checkout').modal('hide');
                }
            });
        });

        $('#checkin_student').click(function(){
            var alumno = $('#id_alumno').val();
            $.ajax({
                data: { alumno: alumno, estado: 0 },
                synch: 'true',
                type: 'POST',
                url: _root_ + 'alumno/bajaAlumno',
                success: function(data){
                    if (data === '1') {
                        $('#student_snack').attr('data-content', 'Alumno dado de ALTA correctamente!');
                    } else {
                        $('#student_snack').attr('data-content', 'No fue posible dar de ALTA al alumno!');
                    }
                    $('#student_snack').snackbar('show');
                    $('#checkin').modal('hide');
                }
            });
        });

        $('#no_checkout').click(function(){
            $("#check_out").prop("checked", false);
        });
    },

    //Dar de alta alumno
    checkinStudent: function() {
        let that = this;
        $('.checkin_student').click(function(){
            var student_id   = $(this).data('alumno'),
                student_name = $(this).data('nombre');

            console.log(student_id, student_name);
            $('#num_alumno').val(student_id);
            $('#nombre_alumno').text(student_name);
            $('#checkin_st').modal('show');
        });

        $('#checked_student').click(function(){
            var alumno = $('#num_alumno').val();
            $.ajax({
                data: { alumno: alumno, estado: 0 },
                synch: 'true',
                type: 'POST',
                url: _root_ + 'alumno/bajaAlumno',
                success: function(data){
                    if (data === '1') {
                        $('#general_snack').attr('data-content', 'Alumno dado de ALTA correctamente!');
                    } else {
                        $('#general_snack').attr('data-content', 'No fue posible dar de ALTA al alumno!');
                    }
                    $('#general_snack').snackbar('show');
                    $('#checkin_st').modal('hide');
                    that.displayStudentsCheckout();
                }
            });
        });
    },

    getInvoiceListStudents: function(){
        let that = this;

        $('.invoice_list').click(function() {
            $.ajax({
                synch: 'true',
                type: 'POST',
                url: _root_ + 'alumno/obtenerListaFactura',
                success: function(data){
                    $('#invoice_students_list').html(data);
                    $('#invoice_list').modal('show');
                    $('#tbl_invoice').DataTable();
                }
            });
        });
    },

    //TODO: pendigs
    deleteStudent: function(){
        let that = this;
        $('.btnDeleteStudent').on('click', function(){
            var alumno_id = $(this).attr('id'),
                alumno_name = $(this).data('name');
            $('#alumno_id').val(alumno_id);
            $('#alumno_name').text(alumno_name);
            $('#modalDeleteStudent').modal('show');
        });
    },

    confirmDelete: function(){
        let that = this;
        $('#confirmDeleteStudent').on('click', function(){
            var alumno = $('#alumno_id').val();
            $.ajax({
                data: { alumno: alumno },
                synch: 'true',
                type: 'POST',
                url: _root_ + 'alumno/eliminarAlumno',
                success: function(data){
                    var response = JSON.parse(data);
                    if (response === 1) {
                        $('#general_snack').attr('data-content', 'Alumno eliminado correctamente!');
                    } else {
                        $('#general_snack').attr('data-content', 'No fue posible eliminar al alumno!');
                    }
                    $('#modalDeleteStudent').modal('hide');
                }
            });
        });
    },

    activeData: function() {

        $('#tutor_yes').click(function() {
            $('#info_tutor').show();
            $('#continue').text('');
        });

        $('#tutor_not').click(function() {
            $('#info_tutor').hide();
            $('#continue').text('Continúe con los datos del alumno.');
        });
        
        $('.sicknes_detail').hide();
        $('#isSick_yes').click(function() {
            $('.sicknes_detail').show();
        });

        $('#isSick_not').click(function() {
            $('.sicknes_detail').hide();
        });

        $('#describa').hide();
        $('#optionSi').click(function() {
            $('#describa').show();
        });

        $('#optionNo').click(function() {
            $('#describa').hide();
        });

        $('#fecha_inicio').datepicker({
            format: "yyyy-mm-dd",
            autoclose: true
        });

        $('#bornday').datepicker({
            format: "yyyy-mm-dd",
            autoclose: true
        });

        $('.extra').hide();
        $('#nivel').change(function(){
            var nivel = $(this).val();
            if (nivel === 'Primaria' || nivel === 'Licenciatura') {
                $('.extra').show();
            } else {
                $('.extra').hide();
            }
        });

        $("#avatar").fileinput({
            showCaption: true,
            browseClass: "btn btn-info btn-sm btn-lg",
            fileType: "image"
        });
    },

    tables: function(group) {
        $('#tbl_students_'+group).DataTable();
        $('#tbl_primary').DataTable();
        $('#tbl_adols').DataTable();
        $('#tbl_adults').DataTable();
    },
    
};

Alumnos.initialize();
