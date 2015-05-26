// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require foundation
//= require turbolinks
//= require_tree .

$(document).ready(function() {
    buttons = new answerButtons('quiz_form');
    $(document).on("ajax:success", function(e, data, status, xhr) {
	window.setTimeout(function() {
	    if ($(data).find('.answer-option').length > 0 || $(data).find('.win').length > 0) {
		buttons.correctAnswer();
	    } else {
		buttons.showCorrectAnswer($(data).find('#wrong_answer').data('correctanswer'));
	    }
	}, 2000);
	window.setTimeout(function() {
	    $('.content').html(data);
	    buttons.init();
	}, 4000);
    });
});

var answerButtons = function(formid) {

    this.buttons;
    this.formid = formid;
    this.form;
    this.markedBtn;

    this.init = function() {
	this.buttons = new Array();
	this.form = document.getElementById(this.formid);
	this.getButtons();
    };

    this.getButtons = function() {
	var self = this;
	if ($('.answer-option').length > 0) {
	    $('.answer-option').each(function(index, element) {
		var el = $(element);
		self.buttons[el.data('answer')] = new Array();
		self.buttons[el.data('answer')]['button'] = el;
		self.buttons[el.data('answer')]['checkbox'] = document.getElementById('answer_' + el.data('answer'));
	    });
	    self.bindButtons();
	}
    };

    this.bindButtons = function() {
	var self = this;
	for (var i = 0; i < this.buttons.length; i++) {
	    var button = this.buttons[i]['button'];
	    button.on('click', function() {
		var c = self.buttons[$(this).data('answer')]['checkbox'];
		c.checked = true;
		self.checkButton($(this));
	    });
	}
    };

    this.checkButton = function(btn) {
	var self = this;
	this.markedBtn = btn;
	btn.addClass('marked');

	this.sendForm();
    };
    
    this.correctAnswer = function() {
	this.markedBtn.removeClass('marked');
	this.markedBtn.addClass('correct');
    };
    
    this.showCorrectAnswer = function(correctAnswer) {
	this.markedBtn.removeClass('marked');
	this.markedBtn.addClass('incorrect');
	console.log($(this.buttons[correctAnswer]));
	this.buttons[correctAnswer]['button'].addClass('correct');
    };

    this.sendForm = function() {
	$(this.form).trigger('submit.rails');
    };

    this.init();
};
$(function(){ $(document).foundation(); });
