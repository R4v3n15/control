var Pagos = {

    vars  : {
        currentPage : 0,
    },

    initialize: function(){
        console.log('Pagos Initialize');
        this.defaultPaylist();
        this.getPaylist();

        // Test Functions
        this.defaultValues();
        this.sarchList();
    },

    defaultPaylist: function(){
        let that = this;
        var list = sessionStorage.getItem('plist_alive');
        that.showPaylist(list); 
    },

    getPaylist: function(){
        let that = this;
        $('.menu_pay_list li').on('click', function(){ 
            var list = $(this).data('group');
            that.showPaylist(list);
            
        }); 
    },

    showPaylist: function(lista, page=0){
        let that = this;
        $.ajax({
            data: { lista :  lista, page: page },
            synch: 'true',
            type: 'POST',
            url: _root_ + 'pagos/obtenerListaPagos',
            success: function(data){
                switch(parseInt(lista)) {
                    case 1: $('#pay_club').html(data);
                        break;
                    case 2: $('#pay_primary').html(data); 
                        break;
                    case 3: $('#pay_adolescent').html(data);
                        break;
                    case 4: $('#pay_adult').html(data);
                        break;
                    case 6: $('#pay_all').html(data);
                        break;
                }
                $.material.init();
                that.showModalPay();
                that.addComment();
                that.navigationPage(lista);
            }
        });
    },

    navigationPage: function(lista){
        let that = this;
        $(".page-students").on('click', function(event){
            event.preventDefault();
            that.vars.currentPage = parseInt($(this).data("students"));
            that.showPaylist(lista, $(this).data("students"));
        });
    },

    showModalPay: function() {
        let that = this;
        $('.check_pay').on('click', function(event){
            event.preventDefault();
            let student_name = $(this).data('name'),
                student_id   = $(this).data('student'),
                month_title  = $(this).data('title'),
                month_id     = $(this).data('month'),
                status       = $(this).data('status');
            $('#student_name').text(student_name);
            $('#student_id').val(student_id);
            $('#month_to_pay').val(month_id);
            $('#month_name').text(month_title)
            $("#pay_action option[value='" + status +"']").attr("selected", true);
            $('#modalPayMonth').modal('show');
        });

        // Enviar formulario de pago mensual a PHP
        $('#toggle_pay').on('click', function(event){
            event.preventDefault();
            let student    = $('#student_id').val(),
                month      = $('#month_to_pay').val(),
                pay_action = $('#pay_action').val(); // 0/null:Adeudo, 1:pagar, 2:becado, 3:no aplica

            console.log(student, month, pay_action);
            if (student !== '' && month !== '' && pay_action !== '') {
                $.ajax({
                    data: { student:  student, month: month, action: pay_action },
                    synch: 'true',
                    type: 'POST',
                    url: _root_ + 'pagos/pagarMes',
                    success: function(data){
                        if (data.success) {
                            var list = sessionStorage.getItem('plist_alive');
                            let page = that.vars.currentPage;
                            $('#modalPayMonth').modal('hide');
                            $('#general_snack').attr('data-content', 'Pago de Mensualidad Actualizado!');
                            $('#general_snack').snackbar('show');
                            $('.snackbar').addClass('snackbar-blue');
                            that.showPaylist(list, page);
                        } else {
                            console.log(data);
                            $('#response').html("Error Desconocido: Por favor reporte este problema.");
                        }
                        $("#pay_action").val("");
                    }
                });
            } else {
                $('#response').html('Falta Información para terminar');
            }
        });
    },

    addComment: function(){
        let that = this;
        $('.add_comment').click(function(event){
            event.preventDefault();
            $('#id_alumno').val($(this).data('student'));
            $('#add_comment_modal').modal('show');
        });

        $('#save_comment').click(function(event){
            event.preventDefault();
            let student = $('#id_alumno').val(),
                comment = $('#comment').val();

            if (student !== '') {
                $.ajax({
                    data: {student:  student, comment: comment },
                    synch: 'true',
                    type: 'POST',
                    url: _root_ + 'pagos/guardarComentario',
                    success: function(data){
                        if (data.success) {
                            var list = sessionStorage.getItem('plist_alive');
                            $('#general_snack').attr('data-content', 'Comentario Actualizado!');
                            $('#general_snack').snackbar('show');
                            $('.snackbar').addClass('snackbar-blue');
                            that.showPaylist(list);
                        } else {
                            $('#general_snack').attr('data-content', 'Error: Intente de Nuevo o reporte el problema!');
                            $('#general_snack').snackbar('show');
                            $('.snackbar').addClass('snackbar-red');
                        }

                        $('#add_comment_modal').modal('hide');
                        
                    }
                });
            }
        });
    },

    tables: function(list) {
        $('#tbl_paylist_'+list).DataTable();
    },

    // TEST SECTION
    defaultValues: function(){
        let that = this;
        var ciclo = $('#ciclo').val();
        $.ajax({
            data: {ciclo:  ciclo },
            synch: 'false',
            type: 'POST',
            url: _root_ + 'pagos/mesesCiclo',
            success: function(data){
                $('#month').html(data);
            }
        }); 
    },

    sarchList: function(){
        let that = this;
        $('#ciclo').on('change', function(){ 
            let ciclo = $(this).val();
            $.ajax({
                data: {ciclo:  ciclo },
                synch: 'true',
                type: 'POST',
                url: _root_ + 'pagos/mesesCiclo',
                success: function(data){
                    $('#month').html(data);
                }
            });
        });

        $('#search_list').on('click', function(){ 
            let list  = $('#list').val(),
                year  = $('#year').val(),
                ciclo = $('#ciclo').val(),
                month = $('#month').val();
            if (list !== '' && year !== '' && ciclo !== '' && month !== '') {
                $.ajax({
                    data: {grupo: list, anio: year, ciclo: ciclo, mes: month },
                    synch: 'true',
                    type: 'POST',
                    url: _root_ + 'pagos/listaAdeudos',
                    success: function(data){
                        $('#pay_list').html(data);
                    }
                });
            }
        });
    },

    showList: function(lista, mes){
        let that = this;
        $.ajax({
            data: { grupo:  lista, mes: mes },
            synch: 'true',
            type: 'POST',
            url: _root_ + 'pagos/obtenerPagosMes',
            success: function(data){
                switch(parseInt(lista)) {
                    case 1: $('#list_club').html(data);
                        break;
                    case 2: $('#list_primary').html(data); 
                        break;
                    case 3: $('#list_adolescent').html(data);
                        break;
                    case 4: $('#list_adult').html(data);
                        break;
                    case 6: $('#list_all').html(data);
                        break;
                }
                $.material.init();
                // that.showModalPay();
                that.tablesList(lista);
            }
        });
    },

    tablesList: function(list) {
        $('#tbl_list_'+list).DataTable();
    },
};

Pagos.initialize();
