module ApplicationHelper
  def basic_actions_dropdown(object, object_distinct_name)
    object_controller = object.class.to_s.tableize
    object_name = object.class.to_s.titleize

    if can? :show, object
      link_to I18n.t('show'), object, hidden: 'hidden'
    else
      ''
    end +

    if can? :update, object
      link_to url_for(controller: object_controller, action: 'edit', id: object.id), class: 'btn btn-primary btn-md',  data: { action: I18n.t('edit'), dismiss: I18n.t('cancel') }, title: I18n.t('edit') do
        content_tag(:i, nil, class: 'fa fa-pencil')
      end
    else
      ''
    end +

    if can? :destroy, object
      note = "#{object_name.parameterize('_')}.alert.destroy_#{object_name.parameterize('_')}_note"
      link_to url_for(controller: object_controller, action: 'destroy', id: object.id), class: 'btn btn-primary btn-md', method: :delete, data: { confirm: I18n.t(:'alert.destroy', object_name: object_distinct_name), note: I18n.t(note), action: I18n.t('delete'), "action-type": I18n.t('confirm_deletion'), dismiss: I18n.t('cancel') }, title: I18n.t('delete') do
        content_tag(:i, nil, class: 'fa fa-trash')
      end
    else
      ''
    end
  end

  def quiz_mode_index_dropdown(object)
    if object.quiz_items.present?
      link_to url_for(controller: 'quiz_modes', action: 'take_quiz', id: object.id), class: 'btn btn-primary btn-md',  data: { action: I18n.t('quiz_mode.take_quiz'), dismiss: I18n.t('cancel') }, title: I18n.t('quiz_mode.take_quiz') do
        content_tag(:i, nil, class: 'fa fa-list-ol')
      end
    end
  end

  def active?(controller_names = [])
    'active' if controller_names.include?(params[:controller])
  end
end
