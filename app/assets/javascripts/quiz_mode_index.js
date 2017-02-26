jQuery(document).ready(function() {
  $('#quiz_mode_index-table').dataTable({
    "dom": '<"top"<"row"<"col-md-6 col-sm-8 col-xs-12 new-button form-group"><"col-md-6 col-sm-4 col-xs-12 form-group filter-group" f <"clear-filter quiz_mode_index-clear-filter">><"col-md-6 col-sm-3 col-xs-12 form-group" l><"col-md-6 col-sm-9 col-xs-12" p>><"row"<"col-sm-12 table-responsive"rt>><"bottom"<"dt-row"<"col-sm-6 deactivate-button"><"col-sm-6 col-xs-12 pull-right" i>>><"clear">',
    "order": [[ 0, "asc" ]],
    "stateSave": true,
    "stateDuration": -1,
    "processing": true,
    "serverSide": true,
    "ajax": $('#quiz_mode_index-table').data('source'),
    "columnDefs": [ {
      "targets": 'no-sort',
      "orderable": false
    }],
    "columns": [
      null,
      null,
      null,
      null
    ],
    "responsive": true,
    "aaSorting": [],
    "autoWidth": false,
    "columnDefs": [ {
      "targets": 'no-sort',
      "orderable": false,
    },
    {
      "targets": 'no-search',
      "searchable": false,
    },
    {
      "className": "hide_column",
      "targets": 'hidden',
    },
    {
      "targets": 'fixed_percent_width',
      "sWidth": "50%",
    }],
    "oLanguage": {
      "sEmptyTable": I18n.t('sEmptyTable'),
      "sInfo": I18n.t('sInfo'),
      "sInfoEmpty": I18n.t('sInfoEmpty'),
      "sInfoFiltered": I18n.t('sInfoFiltered'),
      "sInfoPostFix": I18n.t('sInfoPostFix'),
      "sInfoThousands": I18n.t('sInfoThousands'),
      "sLengthMenu": I18n.t('sLengthMenu'),
      "sLoadingRecords": I18n.t('sLoadingRecords'),
      "sProcessing": I18n.t('sProcessing'),
      "sSearch": "",
      "sZeroRecords": I18n.t('sZeroRecords'),
      "oPaginate": {
        "sFirst": I18n.t('oPaginate.sFirst'),
        "sLast": I18n.t('oPaginate.sLast'),
        "sNext": I18n.t('oPaginate.sNext'),
        "sPrevious": I18n.t('oPaginate.sPrevious')
      },
      "oAria": {
        "sSortAscending": I18n.t('oAria.sSortAscending'),
        "sSortDescending": I18n.t('oAria.sSortDescending')
      }
    },
    "fnDrawCallback": function (oSettings) {
      dt_id = $(this).selector.split('#').pop();
      dt_as_key = 'DataTables_' + dt_id + '_' + window.location.pathname;
      for (var key in sessionStorage){
        if (key != dt_as_key) {
          sessionStorage.removeItem(key);
        }
      }
    }
  });

  language = I18n.locale

  $('div.dataTables_filter input').attr('placeholder', I18n.t('sSearch'));
  $("div.quiz_mode_index-clear-filter").html("<a href='#' id='quiz_mode_index-clear-filter'>"+'Clear'+"</a>");
  $('#quiz_mode_index-clear-filter').on('click', function(event){
    var table = $('#quiz_mode_index-table').DataTable();
    table
      .state.clear()
      .order( [ 0, "asc" ] )
      .search('')
      .columns().search('')
      .draw();
  });
});
