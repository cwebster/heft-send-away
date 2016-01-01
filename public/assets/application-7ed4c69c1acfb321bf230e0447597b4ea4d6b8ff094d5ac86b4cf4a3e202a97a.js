!function(t,e){"use strict";t.rails!==e&&t.error("jquery-ujs has already been loaded!");var a,i=t(document);t.rails=a={linkClickSelector:"a[data-confirm], a[data-method], a[data-remote], a[data-disable-with], a[data-disable]",buttonClickSelector:"button[data-remote]:not(form button), button[data-confirm]:not(form button)",inputChangeSelector:"select[data-remote], input[data-remote], textarea[data-remote]",formSubmitSelector:"form",formInputClickSelector:"form input[type=submit], form input[type=image], form button[type=submit], form button:not([type]), input[type=submit][form], input[type=image][form], button[type=submit][form], button[form]:not([type])",disableSelector:"input[data-disable-with]:enabled, button[data-disable-with]:enabled, textarea[data-disable-with]:enabled, input[data-disable]:enabled, button[data-disable]:enabled, textarea[data-disable]:enabled",enableSelector:"input[data-disable-with]:disabled, button[data-disable-with]:disabled, textarea[data-disable-with]:disabled, input[data-disable]:disabled, button[data-disable]:disabled, textarea[data-disable]:disabled",requiredInputSelector:"input[name][required]:not([disabled]),textarea[name][required]:not([disabled])",fileInputSelector:"input[type=file]:not([disabled])",linkDisableSelector:"a[data-disable-with], a[data-disable]",buttonDisableSelector:"button[data-remote][data-disable-with], button[data-remote][data-disable]",csrfToken:function(){return t("meta[name=csrf-token]").attr("content")},csrfParam:function(){return t("meta[name=csrf-param]").attr("content")},CSRFProtection:function(t){var e=a.csrfToken();e&&t.setRequestHeader("X-CSRF-Token",e)},refreshCSRFTokens:function(){t('form input[name="'+a.csrfParam()+'"]').val(a.csrfToken())},fire:function(e,a,i){var s=t.Event(a);return e.trigger(s,i),s.result!==!1},confirm:function(t){return confirm(t)},ajax:function(e){return t.ajax(e)},href:function(t){return t[0].href},isRemote:function(t){return t.data("remote")!==e&&t.data("remote")!==!1},handleRemote:function(i){var s,n,r,o,h,l;if(a.fire(i,"ajax:before")){if(o=i.data("with-credentials")||null,h=i.data("type")||t.ajaxSettings&&t.ajaxSettings.dataType,i.is("form")){s=i.attr("method"),n=i.attr("action"),r=i.serializeArray();var d=i.data("ujs:submit-button");d&&(r.push(d),i.data("ujs:submit-button",null))}else i.is(a.inputChangeSelector)?(s=i.data("method"),n=i.data("url"),r=i.serialize(),i.data("params")&&(r=r+"&"+i.data("params"))):i.is(a.buttonClickSelector)?(s=i.data("method")||"get",n=i.data("url"),r=i.serialize(),i.data("params")&&(r=r+"&"+i.data("params"))):(s=i.data("method"),n=a.href(i),r=i.data("params")||null);return l={type:s||"GET",data:r,dataType:h,beforeSend:function(t,s){return s.dataType===e&&t.setRequestHeader("accept","*/*;q=0.5, "+s.accepts.script),a.fire(i,"ajax:beforeSend",[t,s])?void i.trigger("ajax:send",t):!1},success:function(t,e,a){i.trigger("ajax:success",[t,e,a])},complete:function(t,e){i.trigger("ajax:complete",[t,e])},error:function(t,e,a){i.trigger("ajax:error",[t,e,a])},crossDomain:a.isCrossDomain(n)},o&&(l.xhrFields={withCredentials:o}),n&&(l.url=n),a.ajax(l)}return!1},isCrossDomain:function(t){var e=document.createElement("a");e.href=location.href;var a=document.createElement("a");try{return a.href=t,a.href=a.href,!((!a.protocol||":"===a.protocol)&&!a.host||e.protocol+"//"+e.host==a.protocol+"//"+a.host)}catch(i){return!0}},handleMethod:function(i){var s=a.href(i),n=i.data("method"),r=i.attr("target"),o=a.csrfToken(),h=a.csrfParam(),l=t('<form method="post" action="'+s+'"></form>'),d='<input name="_method" value="'+n+'" type="hidden" />';h===e||o===e||a.isCrossDomain(s)||(d+='<input name="'+h+'" value="'+o+'" type="hidden" />'),r&&l.attr("target",r),l.hide().append(d).appendTo("body"),l.submit()},formElements:function(e,a){return e.is("form")?t(e[0].elements).filter(a):e.find(a)},disableFormElements:function(e){a.formElements(e,a.disableSelector).each(function(){a.disableFormElement(t(this))})},disableFormElement:function(t){var a,i;a=t.is("button")?"html":"val",i=t.data("disable-with"),t.data("ujs:enable-with",t[a]()),i!==e&&t[a](i),t.prop("disabled",!0)},enableFormElements:function(e){a.formElements(e,a.enableSelector).each(function(){a.enableFormElement(t(this))})},enableFormElement:function(t){var e=t.is("button")?"html":"val";"undefined"!=typeof t.data("ujs:enable-with")&&t[e](t.data("ujs:enable-with")),t.prop("disabled",!1)},allowAction:function(t){var e,i=t.data("confirm"),s=!1;if(!i)return!0;if(a.fire(t,"confirm")){try{s=a.confirm(i)}catch(n){(console.error||console.log).call(console,n.stack||n)}e=a.fire(t,"confirm:complete",[s])}return s&&e},blankInputs:function(e,a,i){var s,n,r=t(),o=a||"input,textarea",h=e.find(o);return h.each(function(){if(s=t(this),n=s.is("input[type=checkbox],input[type=radio]")?s.is(":checked"):!!s.val(),n===i){if(s.is("input[type=radio]")&&h.filter('input[type=radio]:checked[name="'+s.attr("name")+'"]').length)return!0;r=r.add(s)}}),r.length?r:!1},nonBlankInputs:function(t,e){return a.blankInputs(t,e,!0)},stopEverything:function(e){return t(e.target).trigger("ujs:everythingStopped"),e.stopImmediatePropagation(),!1},disableElement:function(t){var i=t.data("disable-with");t.data("ujs:enable-with",t.html()),i!==e&&t.html(i),t.bind("click.railsDisable",function(t){return a.stopEverything(t)})},enableElement:function(t){t.data("ujs:enable-with")!==e&&(t.html(t.data("ujs:enable-with")),t.removeData("ujs:enable-with")),t.unbind("click.railsDisable")}},a.fire(i,"rails:attachBindings")&&(t.ajaxPrefilter(function(t,e,i){t.crossDomain||a.CSRFProtection(i)}),t(window).on("pageshow.rails",function(){t(t.rails.enableSelector).each(function(){var e=t(this);e.data("ujs:enable-with")&&t.rails.enableFormElement(e)}),t(t.rails.linkDisableSelector).each(function(){var e=t(this);e.data("ujs:enable-with")&&t.rails.enableElement(e)})}),i.delegate(a.linkDisableSelector,"ajax:complete",function(){a.enableElement(t(this))}),i.delegate(a.buttonDisableSelector,"ajax:complete",function(){a.enableFormElement(t(this))}),i.delegate(a.linkClickSelector,"click.rails",function(e){var i=t(this),s=i.data("method"),n=i.data("params"),r=e.metaKey||e.ctrlKey;if(!a.allowAction(i))return a.stopEverything(e);if(!r&&i.is(a.linkDisableSelector)&&a.disableElement(i),a.isRemote(i)){if(r&&(!s||"GET"===s)&&!n)return!0;var o=a.handleRemote(i);return o===!1?a.enableElement(i):o.fail(function(){a.enableElement(i)}),!1}return s?(a.handleMethod(i),!1):void 0}),i.delegate(a.buttonClickSelector,"click.rails",function(e){var i=t(this);if(!a.allowAction(i)||!a.isRemote(i))return a.stopEverything(e);i.is(a.buttonDisableSelector)&&a.disableFormElement(i);var s=a.handleRemote(i);return s===!1?a.enableFormElement(i):s.fail(function(){a.enableFormElement(i)}),!1}),i.delegate(a.inputChangeSelector,"change.rails",function(e){var i=t(this);return a.allowAction(i)&&a.isRemote(i)?(a.handleRemote(i),!1):a.stopEverything(e)}),i.delegate(a.formSubmitSelector,"submit.rails",function(i){var s,n,r=t(this),o=a.isRemote(r);if(!a.allowAction(r))return a.stopEverything(i);if(r.attr("novalidate")===e&&(s=a.blankInputs(r,a.requiredInputSelector,!1),s&&a.fire(r,"ajax:aborted:required",[s])))return a.stopEverything(i);if(o){if(n=a.nonBlankInputs(r,a.fileInputSelector)){setTimeout(function(){a.disableFormElements(r)},13);var h=a.fire(r,"ajax:aborted:file",[n]);return h||setTimeout(function(){a.enableFormElements(r)},13),h}return a.handleRemote(r),!1}setTimeout(function(){a.disableFormElements(r)},13)}),i.delegate(a.formInputClickSelector,"click.rails",function(e){var i=t(this);if(!a.allowAction(i))return a.stopEverything(e);var s=i.attr("name"),n=s?{name:s,value:i.val()}:null;i.closest("form").data("ujs:submit-button",n)}),i.delegate(a.formSubmitSelector,"ajax:send.rails",function(e){this===e.target&&a.disableFormElements(t(this))}),i.delegate(a.formSubmitSelector,"ajax:complete.rails",function(e){this===e.target&&a.enableFormElements(t(this))}),t(function(){a.refreshCSRFTokens()}))}(jQuery),/* =========================================================
 * bootstrap-datepicker.js
 * http://www.eyecon.ro/bootstrap-datepicker
 * =========================================================
 * Copyright 2012 Stefan Petre
 * Improvements by Andrew Rowls
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 * ========================================================= */
function(t){function e(){return new Date(Date.UTC.apply(Date,arguments))}function a(e,a){var i,s=t(e).data(),n={},r=new RegExp("^"+a.toLowerCase()+"([A-Z])"),a=new RegExp("^"+a.toLowerCase());for(var o in s)a.test(o)&&(i=o.replace(r,function(t,e){return e.toLowerCase()}),n[i]=s[o]);return n}function i(e){var a={};if(d[e]||(e=e.split("-")[0],d[e])){var i=d[e];return t.each(l,function(t,e){e in i&&(a[e]=i[e])}),a}}var s=t(window),n=function(e,a){this._process_options(a),this.element=t(e),this.isInline=!1,this.isInput=this.element.is("input"),this.component=this.element.is(".date")?this.element.find(".add-on, .btn"):!1,this.hasInput=this.component&&this.element.find("input").length,this.component&&0===this.component.length&&(this.component=!1),this.picker=t(c.template),this._buildEvents(),this._attachEvents(),this.isInline?this.picker.addClass("datepicker-inline").appendTo(this.element):this.picker.addClass("datepicker-dropdown dropdown-menu"),this.o.rtl&&(this.picker.addClass("datepicker-rtl"),this.picker.find(".prev i, .next i").toggleClass("icon-arrow-left icon-arrow-right")),this.viewMode=this.o.startView,this.o.calendarWeeks&&this.picker.find("tfoot th.today").attr("colspan",function(t,e){return parseInt(e)+1}),this._allow_update=!1,this.setStartDate(this._o.startDate),this.setEndDate(this._o.endDate),this.setDaysOfWeekDisabled(this.o.daysOfWeekDisabled),this.fillDow(),this.fillMonths(),this._allow_update=!0,this.update(),this.showMode(),this.isInline&&this.show()};n.prototype={constructor:n,_process_options:function(e){this._o=t.extend({},this._o,e);var a=this.o=t.extend({},this._o),i=a.language;switch(d[i]||(i=i.split("-")[0],d[i]||(i=h.language)),a.language=i,a.startView){case 2:case"decade":a.startView=2;break;case 1:case"year":a.startView=1;break;default:a.startView=0}switch(a.minViewMode){case 1:case"months":a.minViewMode=1;break;case 2:case"years":a.minViewMode=2;break;default:a.minViewMode=0}a.startView=Math.max(a.startView,a.minViewMode),a.weekStart%=7,a.weekEnd=(a.weekStart+6)%7;var s=c.parseFormat(a.format);a.startDate!==-(1/0)&&(a.startDate?a.startDate instanceof Date?a.startDate=this._local_to_utc(this._zero_time(a.startDate)):a.startDate=c.parseDate(a.startDate,s,a.language):a.startDate=-(1/0)),a.endDate!==1/0&&(a.endDate?a.endDate instanceof Date?a.endDate=this._local_to_utc(this._zero_time(a.endDate)):a.endDate=c.parseDate(a.endDate,s,a.language):a.endDate=1/0),a.daysOfWeekDisabled=a.daysOfWeekDisabled||[],t.isArray(a.daysOfWeekDisabled)||(a.daysOfWeekDisabled=a.daysOfWeekDisabled.split(/[,\s]*/)),a.daysOfWeekDisabled=t.map(a.daysOfWeekDisabled,function(t){return parseInt(t,10)});var n=String(a.orientation).toLowerCase().split(/\s+/g),r=a.orientation.toLowerCase();if(n=t.grep(n,function(t){return/^auto|left|right|top|bottom$/.test(t)}),a.orientation={x:"auto",y:"auto"},r&&"auto"!==r)if(1===n.length)switch(n[0]){case"top":case"bottom":a.orientation.y=n[0];break;case"left":case"right":a.orientation.x=n[0]}else r=t.grep(n,function(t){return/^left|right$/.test(t)}),a.orientation.x=r[0]||"auto",r=t.grep(n,function(t){return/^top|bottom$/.test(t)}),a.orientation.y=r[0]||"auto";else;},_events:[],_secondaryEvents:[],_applyEvents:function(t){for(var e,a,i=0;i<t.length;i++)e=t[i][0],a=t[i][1],e.on(a)},_unapplyEvents:function(t){for(var e,a,i=0;i<t.length;i++)e=t[i][0],a=t[i][1],e.off(a)},_buildEvents:function(){this.isInput?this._events=[[this.element,{focus:t.proxy(this.show,this),keyup:t.proxy(this.update,this),keydown:t.proxy(this.keydown,this)}]]:this.component&&this.hasInput?this._events=[[this.element.find("input"),{focus:t.proxy(this.show,this),keyup:t.proxy(this.update,this),keydown:t.proxy(this.keydown,this)}],[this.component,{click:t.proxy(this.show,this)}]]:this.element.is("div")?this.isInline=!0:this._events=[[this.element,{click:t.proxy(this.show,this)}]],this._secondaryEvents=[[this.picker,{click:t.proxy(this.click,this)}],[t(window),{resize:t.proxy(this.place,this)}],[t(document),{mousedown:t.proxy(function(t){this.element.is(t.target)||this.element.find(t.target).length||this.picker.is(t.target)||this.picker.find(t.target).length||this.hide()},this)}]]},_attachEvents:function(){this._detachEvents(),this._applyEvents(this._events)},_detachEvents:function(){this._unapplyEvents(this._events)},_attachSecondaryEvents:function(){this._detachSecondaryEvents(),this._applyEvents(this._secondaryEvents)},_detachSecondaryEvents:function(){this._unapplyEvents(this._secondaryEvents)},_trigger:function(e,a){var i=a||this.date,s=this._utc_to_local(i);this.element.trigger({type:e,date:s,format:t.proxy(function(t){var e=t||this.o.format;return c.formatDate(i,e,this.o.language)},this)})},show:function(t){this.isInline||this.picker.appendTo("body"),this.picker.show(),this.height=this.component?this.component.outerHeight():this.element.outerHeight(),this.place(),this._attachSecondaryEvents(),t&&t.preventDefault(),this._trigger("show")},hide:function(t){this.isInline||this.picker.is(":visible")&&(this.picker.hide().detach(),this._detachSecondaryEvents(),this.viewMode=this.o.startView,this.showMode(),this.o.forceParse&&(this.isInput&&this.element.val()||this.hasInput&&this.element.find("input").val())&&this.setValue(),this._trigger("hide"))},remove:function(){this.hide(),this._detachEvents(),this._detachSecondaryEvents(),this.picker.remove(),delete this.element.data().datepicker,this.isInput||delete this.element.data().date},_utc_to_local:function(t){return new Date(t.getTime()+6e4*t.getTimezoneOffset())},_local_to_utc:function(t){return new Date(t.getTime()-6e4*t.getTimezoneOffset())},_zero_time:function(t){return new Date(t.getFullYear(),t.getMonth(),t.getDate())},_zero_utc_time:function(t){return new Date(Date.UTC(t.getUTCFullYear(),t.getUTCMonth(),t.getUTCDate()))},getDate:function(){return this._utc_to_local(this.getUTCDate())},getUTCDate:function(){return this.date},setDate:function(t){this.setUTCDate(this._local_to_utc(t))},setUTCDate:function(t){this.date=t,this.setValue()},setValue:function(){var t=this.getFormattedDate();this.isInput?this.element.val(t).change():this.component&&this.element.find("input").val(t).change()},getFormattedDate:function(t){return void 0===t&&(t=this.o.format),c.formatDate(this.date,t,this.o.language)},setStartDate:function(t){this._process_options({startDate:t}),this.update(),this.updateNavArrows()},setEndDate:function(t){this._process_options({endDate:t}),this.update(),this.updateNavArrows()},setDaysOfWeekDisabled:function(t){this._process_options({daysOfWeekDisabled:t}),this.update(),this.updateNavArrows()},place:function(){if(!this.isInline){var e=this.picker.outerWidth(),a=this.picker.outerHeight(),i=10,n=s.width(),r=s.height(),o=s.scrollTop(),h=parseInt(this.element.parents().filter(function(){return"auto"!=t(this).css("z-index")}).first().css("z-index"))+10,l=this.component?this.component.parent().offset():this.element.offset(),d=this.component?this.component.outerHeight(!0):this.element.outerHeight(!1),c=this.component?this.component.outerWidth(!0):this.element.outerWidth(!1),u=l.left,p=l.top;this.picker.removeClass("datepicker-orient-top datepicker-orient-bottom datepicker-orient-right datepicker-orient-left"),"auto"!==this.o.orientation.x?(this.picker.addClass("datepicker-orient-"+this.o.orientation.x),"right"===this.o.orientation.x&&(u-=e-c)):(this.picker.addClass("datepicker-orient-left"),l.left<0?u-=l.left-i:l.left+e>n&&(u=n-e-i));var f,m,g=this.o.orientation.y;"auto"===g&&(f=-o+l.top-a,m=o+r-(l.top+d+a),g=Math.max(f,m)===m?"top":"bottom"),this.picker.addClass("datepicker-orient-"+g),"top"===g?p+=d:p-=a+parseInt(this.picker.css("padding-top")),this.picker.css({top:p,left:u,zIndex:h})}},_allow_update:!0,update:function(){if(this._allow_update){var t,e=new Date(this.date),a=!1;arguments&&arguments.length&&("string"==typeof arguments[0]||arguments[0]instanceof Date)?(t=arguments[0],t instanceof Date&&(t=this._local_to_utc(t)),a=!0):(t=this.isInput?this.element.val():this.element.data("date")||this.element.find("input").val(),delete this.element.data().date),this.date=c.parseDate(t,this.o.format,this.o.language),a?this.setValue():t?e.getTime()!==this.date.getTime()&&this._trigger("changeDate"):this._trigger("clearDate"),this.date<this.o.startDate?(this.viewDate=new Date(this.o.startDate),this.date=new Date(this.o.startDate)):this.date>this.o.endDate?(this.viewDate=new Date(this.o.endDate),this.date=new Date(this.o.endDate)):(this.viewDate=new Date(this.date),this.date=new Date(this.date)),this.fill()}},fillDow:function(){var t=this.o.weekStart,e="<tr>";if(this.o.calendarWeeks){var a='<th class="cw">&nbsp;</th>';e+=a,this.picker.find(".datepicker-days thead tr:first-child").prepend(a)}for(;t<this.o.weekStart+7;)e+='<th class="dow">'+d[this.o.language].daysMin[t++%7]+"</th>";e+="</tr>",this.picker.find(".datepicker-days thead").append(e)},fillMonths:function(){for(var t="",e=0;12>e;)t+='<span class="month">'+d[this.o.language].monthsShort[e++]+"</span>";this.picker.find(".datepicker-months td").html(t)},setRange:function(e){e&&e.length?this.range=t.map(e,function(t){return t.valueOf()}):delete this.range,this.fill()},getClassNames:function(e){var a=[],i=this.viewDate.getUTCFullYear(),s=this.viewDate.getUTCMonth(),n=this.date.valueOf(),r=new Date;return e.getUTCFullYear()<i||e.getUTCFullYear()==i&&e.getUTCMonth()<s?a.push("old"):(e.getUTCFullYear()>i||e.getUTCFullYear()==i&&e.getUTCMonth()>s)&&a.push("new"),this.o.todayHighlight&&e.getUTCFullYear()==r.getFullYear()&&e.getUTCMonth()==r.getMonth()&&e.getUTCDate()==r.getDate()&&a.push("today"),n&&e.valueOf()==n&&a.push("active"),(e.valueOf()<this.o.startDate||e.valueOf()>this.o.endDate||-1!==t.inArray(e.getUTCDay(),this.o.daysOfWeekDisabled))&&a.push("disabled"),this.range&&(e>this.range[0]&&e<this.range[this.range.length-1]&&a.push("range"),-1!=t.inArray(e.valueOf(),this.range)&&a.push("selected")),a},fill:function(){var a,i=new Date(this.viewDate),s=i.getUTCFullYear(),n=i.getUTCMonth(),r=this.o.startDate!==-(1/0)?this.o.startDate.getUTCFullYear():-(1/0),o=this.o.startDate!==-(1/0)?this.o.startDate.getUTCMonth():-(1/0),h=this.o.endDate!==1/0?this.o.endDate.getUTCFullYear():1/0,l=this.o.endDate!==1/0?this.o.endDate.getUTCMonth():1/0;this.date&&this.date.valueOf();this.picker.find(".datepicker-days thead th.datepicker-switch").text(d[this.o.language].months[n]+" "+s),this.picker.find("tfoot th.today").text(d[this.o.language].today).toggle(this.o.todayBtn!==!1),this.picker.find("tfoot th.clear").text(d[this.o.language].clear).toggle(this.o.clearBtn!==!1),this.updateNavArrows(),this.fillMonths();var u=e(s,n-1,28,0,0,0,0),p=c.getDaysInMonth(u.getUTCFullYear(),u.getUTCMonth());u.setUTCDate(p),u.setUTCDate(p-(u.getUTCDay()-this.o.weekStart+7)%7);var f=new Date(u);f.setUTCDate(f.getUTCDate()+42),f=f.valueOf();for(var m,g=[];u.valueOf()<f;){if(u.getUTCDay()==this.o.weekStart&&(g.push("<tr>"),this.o.calendarWeeks)){var v=new Date(+u+(this.o.weekStart-u.getUTCDay()-7)%7*864e5),D=new Date(+v+(11-v.getUTCDay())%7*864e5),y=new Date(+(y=e(D.getUTCFullYear(),0,1))+(11-y.getUTCDay())%7*864e5),b=(D-y)/864e5/7+1;g.push('<td class="cw">'+b+"</td>")}if(m=this.getClassNames(u),m.push("day"),this.o.beforeShowDay!==t.noop){var w=this.o.beforeShowDay(this._utc_to_local(u));void 0===w?w={}:"boolean"==typeof w?w={enabled:w}:"string"==typeof w&&(w={classes:w}),w.enabled===!1&&m.push("disabled"),w.classes&&(m=m.concat(w.classes.split(/\s+/))),w.tooltip&&(a=w.tooltip)}m=t.unique(m),g.push('<td class="'+m.join(" ")+'"'+(a?' title="'+a+'"':"")+">"+u.getUTCDate()+"</td>"),u.getUTCDay()==this.o.weekEnd&&g.push("</tr>"),u.setUTCDate(u.getUTCDate()+1)}this.picker.find(".datepicker-days tbody").empty().append(g.join(""));var k=this.date&&this.date.getUTCFullYear(),C=this.picker.find(".datepicker-months").find("th:eq(1)").text(s).end().find("span").removeClass("active");k&&k==s&&C.eq(this.date.getUTCMonth()).addClass("active"),(r>s||s>h)&&C.addClass("disabled"),s==r&&C.slice(0,o).addClass("disabled"),s==h&&C.slice(l+1).addClass("disabled"),g="",s=10*parseInt(s/10,10);var T=this.picker.find(".datepicker-years").find("th:eq(1)").text(s+"-"+(s+9)).end().find("td");s-=1;for(var _=-1;11>_;_++)g+='<span class="year'+(-1==_?" old":10==_?" new":"")+(k==s?" active":"")+(r>s||s>h?" disabled":"")+'">'+s+"</span>",s+=1;T.html(g)},updateNavArrows:function(){if(this._allow_update){var t=new Date(this.viewDate),e=t.getUTCFullYear(),a=t.getUTCMonth();switch(this.viewMode){case 0:this.o.startDate!==-(1/0)&&e<=this.o.startDate.getUTCFullYear()&&a<=this.o.startDate.getUTCMonth()?this.picker.find(".prev").css({visibility:"hidden"}):this.picker.find(".prev").css({visibility:"visible"}),this.o.endDate!==1/0&&e>=this.o.endDate.getUTCFullYear()&&a>=this.o.endDate.getUTCMonth()?this.picker.find(".next").css({visibility:"hidden"}):this.picker.find(".next").css({visibility:"visible"});break;case 1:case 2:this.o.startDate!==-(1/0)&&e<=this.o.startDate.getUTCFullYear()?this.picker.find(".prev").css({visibility:"hidden"}):this.picker.find(".prev").css({visibility:"visible"}),this.o.endDate!==1/0&&e>=this.o.endDate.getUTCFullYear()?this.picker.find(".next").css({visibility:"hidden"}):this.picker.find(".next").css({visibility:"visible"})}}},click:function(a){a.preventDefault();var i=t(a.target).closest("span, td, th");if(1==i.length)switch(i[0].nodeName.toLowerCase()){case"th":switch(i[0].className){case"datepicker-switch":this.showMode(1);break;case"prev":case"next":var s=c.modes[this.viewMode].navStep*("prev"==i[0].className?-1:1);switch(this.viewMode){case 0:this.viewDate=this.moveMonth(this.viewDate,s),this._trigger("changeMonth",this.viewDate);break;case 1:case 2:this.viewDate=this.moveYear(this.viewDate,s),1===this.viewMode&&this._trigger("changeYear",this.viewDate)}this.fill();break;case"today":var n=new Date;n=e(n.getFullYear(),n.getMonth(),n.getDate(),0,0,0),this.showMode(-2);var r="linked"==this.o.todayBtn?null:"view";this._setDate(n,r);break;case"clear":var o;this.isInput?o=this.element:this.component&&(o=this.element.find("input")),o&&o.val("").change(),this._trigger("changeDate"),this.update(),this.o.autoclose&&this.hide()}break;case"span":if(!i.is(".disabled")){if(this.viewDate.setUTCDate(1),i.is(".month")){var h=1,l=i.parent().find("span").index(i),d=this.viewDate.getUTCFullYear();this.viewDate.setUTCMonth(l),this._trigger("changeMonth",this.viewDate),1===this.o.minViewMode&&this._setDate(e(d,l,h,0,0,0,0))}else{var d=parseInt(i.text(),10)||0,h=1,l=0;this.viewDate.setUTCFullYear(d),this._trigger("changeYear",this.viewDate),2===this.o.minViewMode&&this._setDate(e(d,l,h,0,0,0,0))}this.showMode(-1),this.fill()}break;case"td":if(i.is(".day")&&!i.is(".disabled")){var h=parseInt(i.text(),10)||1,d=this.viewDate.getUTCFullYear(),l=this.viewDate.getUTCMonth();i.is(".old")?0===l?(l=11,d-=1):l-=1:i.is(".new")&&(11==l?(l=0,d+=1):l+=1),this._setDate(e(d,l,h,0,0,0,0))}}},_setDate:function(t,e){e&&"date"!=e||(this.date=new Date(t)),e&&"view"!=e||(this.viewDate=new Date(t)),this.fill(),this.setValue(),this._trigger("changeDate");var a;this.isInput?a=this.element:this.component&&(a=this.element.find("input")),a&&a.change(),!this.o.autoclose||e&&"date"!=e||this.hide()},moveMonth:function(t,e){if(!e)return t;var a,i,s=new Date(t.valueOf()),n=s.getUTCDate(),r=s.getUTCMonth(),o=Math.abs(e);if(e=e>0?1:-1,1==o)i=-1==e?function(){return s.getUTCMonth()==r}:function(){return s.getUTCMonth()!=a},a=r+e,s.setUTCMonth(a),(0>a||a>11)&&(a=(a+12)%12);else{for(var h=0;o>h;h++)s=this.moveMonth(s,e);a=s.getUTCMonth(),s.setUTCDate(n),i=function(){return a!=s.getUTCMonth()}}for(;i();)s.setUTCDate(--n),s.setUTCMonth(a);return s},moveYear:function(t,e){return this.moveMonth(t,12*e)},dateWithinRange:function(t){return t>=this.o.startDate&&t<=this.o.endDate},keydown:function(t){if(this.picker.is(":not(:visible)"))return void(27==t.keyCode&&this.show());var e,a,i,s=!1;switch(t.keyCode){case 27:this.hide(),t.preventDefault();break;case 37:case 39:if(!this.o.keyboardNavigation)break;e=37==t.keyCode?-1:1,t.ctrlKey?(a=this.moveYear(this.date,e),i=this.moveYear(this.viewDate,e),this._trigger("changeYear",this.viewDate)):t.shiftKey?(a=this.moveMonth(this.date,e),i=this.moveMonth(this.viewDate,e),this._trigger("changeMonth",this.viewDate)):(a=new Date(this.date),a.setUTCDate(this.date.getUTCDate()+e),i=new Date(this.viewDate),i.setUTCDate(this.viewDate.getUTCDate()+e)),this.dateWithinRange(a)&&(this.date=a,this.viewDate=i,this.setValue(),this.update(),t.preventDefault(),s=!0);break;case 38:case 40:if(!this.o.keyboardNavigation)break;e=38==t.keyCode?-1:1,t.ctrlKey?(a=this.moveYear(this.date,e),i=this.moveYear(this.viewDate,e),this._trigger("changeYear",this.viewDate)):t.shiftKey?(a=this.moveMonth(this.date,e),i=this.moveMonth(this.viewDate,e),this._trigger("changeMonth",this.viewDate)):(a=new Date(this.date),a.setUTCDate(this.date.getUTCDate()+7*e),i=new Date(this.viewDate),i.setUTCDate(this.viewDate.getUTCDate()+7*e)),this.dateWithinRange(a)&&(this.date=a,this.viewDate=i,this.setValue(),this.update(),t.preventDefault(),s=!0);break;case 13:this.hide(),t.preventDefault();break;case 9:this.hide()}if(s){this._trigger("changeDate");var n;this.isInput?n=this.element:this.component&&(n=this.element.find("input")),n&&n.change()}},showMode:function(t){t&&(this.viewMode=Math.max(this.o.minViewMode,Math.min(2,this.viewMode+t))),this.picker.find(">div").hide().filter(".datepicker-"+c.modes[this.viewMode].clsName).css("display","block"),this.updateNavArrows()}};var r=function(e,a){this.element=t(e),this.inputs=t.map(a.inputs,function(t){return t.jquery?t[0]:t}),delete a.inputs,t(this.inputs).datepicker(a).bind("changeDate",t.proxy(this.dateUpdated,this)),this.pickers=t.map(this.inputs,function(e){return t(e).data("datepicker")}),this.updateDates()};r.prototype={updateDates:function(){this.dates=t.map(this.pickers,function(t){return t.date}),this.updateRanges()},updateRanges:function(){var e=t.map(this.dates,function(t){return t.valueOf()});t.each(this.pickers,function(t,a){a.setRange(e)})},dateUpdated:function(e){var a=t(e.target).data("datepicker"),i=a.getUTCDate(),s=t.inArray(e.target,this.inputs),n=this.inputs.length;if(-1!=s){if(i<this.dates[s])for(;s>=0&&i<this.dates[s];)this.pickers[s--].setUTCDate(i);else if(i>this.dates[s])for(;n>s&&i>this.dates[s];)this.pickers[s++].setUTCDate(i);this.updateDates()}},remove:function(){t.map(this.pickers,function(t){t.remove()}),delete this.element.data().datepicker}};var o=t.fn.datepicker;t.fn.datepicker=function(e){var s=Array.apply(null,arguments);s.shift();var o;return this.each(function(){var l=t(this),d=l.data("datepicker"),c="object"==typeof e&&e;if(!d){var u=a(this,"date"),p=t.extend({},h,u,c),f=i(p.language),m=t.extend({},h,f,u,c);if(l.is(".input-daterange")||m.inputs){var g={inputs:m.inputs||l.find("input").toArray()};l.data("datepicker",d=new r(this,t.extend(m,g)))}else l.data("datepicker",d=new n(this,m))}return"string"==typeof e&&"function"==typeof d[e]&&(o=d[e].apply(d,s),void 0!==o)?!1:void 0}),void 0!==o?o:this};var h=t.fn.datepicker.defaults={autoclose:!1,beforeShowDay:t.noop,calendarWeeks:!1,clearBtn:!1,daysOfWeekDisabled:[],endDate:1/0,forceParse:!0,format:"mm/dd/yyyy",keyboardNavigation:!0,language:"en",minViewMode:0,orientation:"auto",rtl:!1,startDate:-(1/0),startView:0,todayBtn:!1,todayHighlight:!1,weekStart:0},l=t.fn.datepicker.locale_opts=["format","rtl","weekStart"];t.fn.datepicker.Constructor=n;var d=t.fn.datepicker.dates={en:{days:["Sunday","Monday","Tuesday","Wednesday","Thursday","Friday","Saturday","Sunday"],daysShort:["Sun","Mon","Tue","Wed","Thu","Fri","Sat","Sun"],daysMin:["Su","Mo","Tu","We","Th","Fr","Sa","Su"],months:["January","February","March","April","May","June","July","August","September","October","November","December"],monthsShort:["Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec"],today:"Today",clear:"Clear"}},c={modes:[{clsName:"days",navFnc:"Month",navStep:1},{clsName:"months",navFnc:"FullYear",navStep:1},{clsName:"years",navFnc:"FullYear",navStep:10}],isLeapYear:function(t){return t%4===0&&t%100!==0||t%400===0},getDaysInMonth:function(t,e){return[31,c.isLeapYear(t)?29:28,31,30,31,30,31,31,30,31,30,31][e]},validParts:/dd?|DD?|mm?|MM?|yy(?:yy)?/g,nonpunctuation:/[^ -\/:-@\[\u3400-\u9fff-`{-~\t\n\r]+/g,parseFormat:function(t){var e=t.replace(this.validParts,"\x00").split("\x00"),a=t.match(this.validParts);if(!e||!e.length||!a||0===a.length)throw new Error("Invalid date format.");return{separators:e,parts:a}},parseDate:function(a,i,s){if(a instanceof Date)return a;if("string"==typeof i&&(i=c.parseFormat(i)),/^[\-+]\d+[dmwy]([\s,]+[\-+]\d+[dmwy])*$/.test(a)){var r,o,h=/([\-+]\d+)([dmwy])/,l=a.match(/([\-+]\d+)([dmwy])/g);a=new Date;for(var u=0;u<l.length;u++)switch(r=h.exec(l[u]),o=parseInt(r[1]),r[2]){case"d":a.setUTCDate(a.getUTCDate()+o);break;case"m":a=n.prototype.moveMonth.call(n.prototype,a,o);break;case"w":a.setUTCDate(a.getUTCDate()+7*o);break;case"y":a=n.prototype.moveYear.call(n.prototype,a,o)}return e(a.getUTCFullYear(),a.getUTCMonth(),a.getUTCDate(),0,0,0)}var p,f,r,l=a&&a.match(this.nonpunctuation)||[],a=new Date,m={},g=["yyyy","yy","M","MM","m","mm","d","dd"],v={yyyy:function(t,e){return t.setUTCFullYear(e)},yy:function(t,e){return t.setUTCFullYear(2e3+e)},m:function(t,e){if(isNaN(t))return t;for(e-=1;0>e;)e+=12;for(e%=12,t.setUTCMonth(e);t.getUTCMonth()!=e;)t.setUTCDate(t.getUTCDate()-1);return t},d:function(t,e){return t.setUTCDate(e)}};v.M=v.MM=v.mm=v.m,v.dd=v.d,a=e(a.getFullYear(),a.getMonth(),a.getDate(),0,0,0);var D=i.parts.slice();if(l.length!=D.length&&(D=t(D).filter(function(e,a){return-1!==t.inArray(a,g)}).toArray()),l.length==D.length){for(var u=0,y=D.length;y>u;u++){if(p=parseInt(l[u],10),r=D[u],isNaN(p))switch(r){case"MM":f=t(d[s].months).filter(function(){var t=this.slice(0,l[u].length),e=l[u].slice(0,t.length);return t==e}),p=t.inArray(f[0],d[s].months)+1;break;case"M":f=t(d[s].monthsShort).filter(function(){var t=this.slice(0,l[u].length),e=l[u].slice(0,t.length);return t==e}),p=t.inArray(f[0],d[s].monthsShort)+1}m[r]=p}for(var b,w,u=0;u<g.length;u++)w=g[u],w in m&&!isNaN(m[w])&&(b=new Date(a),v[w](b,m[w]),isNaN(b)||(a=b))}return a},formatDate:function(e,a,i){"string"==typeof a&&(a=c.parseFormat(a));var s={d:e.getUTCDate(),D:d[i].daysShort[e.getUTCDay()],DD:d[i].days[e.getUTCDay()],m:e.getUTCMonth()+1,M:d[i].monthsShort[e.getUTCMonth()],MM:d[i].months[e.getUTCMonth()],yy:e.getUTCFullYear().toString().substring(2),yyyy:e.getUTCFullYear()};s.dd=(s.d<10?"0":"")+s.d,s.mm=(s.m<10?"0":"")+s.m;for(var e=[],n=t.extend([],a.separators),r=0,o=a.parts.length;o>=r;r++)n.length&&e.push(n.shift()),e.push(s[a.parts[r]]);return e.join("")},headTemplate:'<thead><tr><th class="prev">&laquo;</th><th colspan="5" class="datepicker-switch"></th><th class="next">&raquo;</th></tr></thead>',contTemplate:'<tbody><tr><td colspan="7"></td></tr></tbody>',footTemplate:'<tfoot><tr><th colspan="7" class="today"></th></tr><tr><th colspan="7" class="clear"></th></tr></tfoot>'};c.template='<div class="datepicker"><div class="datepicker-days"><table class=" table-condensed">'+c.headTemplate+"<tbody></tbody>"+c.footTemplate+'</table></div><div class="datepicker-months"><table class="table-condensed">'+c.headTemplate+c.contTemplate+c.footTemplate+'</table></div><div class="datepicker-years"><table class="table-condensed">'+c.headTemplate+c.contTemplate+c.footTemplate+"</table></div></div>",t.fn.datepicker.DPGlobal=c,t.fn.datepicker.noConflict=function(){return t.fn.datepicker=o,this},t(document).on("focus.datepicker.data-api click.datepicker.data-api",'[data-provide="datepicker"]',function(e){var a=t(this);a.data("datepicker")||(e.preventDefault(),a.datepicker("show"))}),t(function(){t('[data-provide="datepicker-inline"]').datepicker()})}(window.jQuery);