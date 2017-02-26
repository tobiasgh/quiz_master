@QuizAnswerKeyForm = React.createClass
  getInitialState: ->
    title: ''
    passing_rate: 0.8
    time_limit: -1
    is_randomized: false
  render: ->
    `<div
      className='form-inputs'>
      <div
        className='form-group title required quiz_answer_key_title'>
        <label
          className='control-label title required'>
          Title
        </label>
        <input
          className='form-control string title required'
          type='title'
          id='quiz_answer_key_title'
          placeholder="Something">
        </input>
      </div>
    </div>`