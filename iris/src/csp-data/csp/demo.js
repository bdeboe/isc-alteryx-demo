<?xml version="1.0" encoding="UTF-8"?>
<Export generator="IRIS" version="26">
<CSP name="demo.js" application="/csp/alteryx/" default="1"><![CDATA[
function getRisk(patient, dischargeTo) {
	patient['Discharge_To'] = dischargeTo;
	$.ajax({
		url: location.href.split('/').slice(0,-1).join('/')+'/REST/risk',
		method: "POST",
		contentType: 'application/json; charset=UTF-8',
		data: JSON.stringify(patient),
		complete: function(raw) {
			var response = $.parseJSON(raw.responseText);
			var encID = response['_input']['Encounter_ID'];
			var icon = $('<span class="fa">').css('font-size', '18px');
			var btnClass = "info";
			if ("Probability_yes" in response) {
				var risk = parseFloat(response['Probability_yes'].value);
				//console.log(risk, response);
				if (risk < 0.3) {
					icon.addClass('fa-check-circle').css('color', 'green');
				} else if (risk < 0.7) {
					icon.addClass('fa-exclamation-triangle').css('color', '#ffc107');
					btnClass = "warning";
				} else if (risk < 0.9) {
					icon.addClass('fa-exclamation-circle').css('color', 'tomato');
					btnClass = "danger";
				} else {
					icon.addClass('fa-times-circle').css('color', 'firebrick');
					btnClass = "danger";
				}
				var title = 'Readmission risk: '+risk;
			} else {
				icon.addClass('fa-question-circle').css('color', 'grey');
				var title = 'No readmission risk model available';
			}
			$('#risk-'+encID).empty().append(icon).attr('title', title);
			$('#btn-'+encID).removeClass().addClass('btn btn-sm btn-outline-'+btnClass);
		}
	});
}

function getPatients() {
	$.ajax({
		url: location.href.split('/').slice(0,-1).join('/')+'/REST/patients',
		method: "GET",
		contentType: 'application/json; charset=UTF-8',
		complete: function(raw) {
			var patients = $.parseJSON(raw.responseText).patients;
			// console.log(patients);
			var tab = $('#tab-patients');
			
			$.each(patients, function(i, patient) {
				var tr = $('<tr>').attr('id','enc-'+patient['Encounter_ID']).append(
					$('<td>').text(patient['Patient_Name']),
					$('<td>').text(patient['Gender']),
					$('<td>').addClass('text-nowrap').text(patient['Admit_Date'].split(' ')[0]),
					$('<td>').text(patient['ICU_Days']),
					$('<td>').text(patient['Diagnosis_Description']),
					$('<td>').text(patient['Procedure_Description']),
					$('<td>').text(patient['Department']),
					$('<td>').append(
						$('<select>').change(function() { getRisk(patient, $(this).val()); })
							 .append($('<option>', { value: 'ROUTINE DSCHG, HOME', text: 'home', selected : true }))
							 .append($('<option>', { value: 'REHAB HOSPITAL', text: 'rehab hospital' }))
							 .append($('<option>', { value: 'HOME HEALTH AGENCY', text: 'health agency' }))
							 //.append($('<option>', { value: 'OTHER DEATH', text: 'death' }))
							 .append($('<option>', { value: 'SKILLED NURSING FACILITY', text: 'nursing facility' }))
							 .append($('<option>', { value: 'INTERMEDIATE CARE', text: 'intermediate care' }))
							 .append($('<option>', { value: 'HOSPICE (HOME)', text: 'hospice' }))
					),
					$('<td>').attr('id','risk-'+patient['Encounter_ID']).css('text-align', 'center'),
					$('<td>').append(
						$('<button type="button">')
							.addClass('btn btn-outline-info btn-sm')
							.attr('id','btn-'+patient['Encounter_ID'])
							.text("discharge")
					)
				).appendTo(tab);
				
				getRisk(patient, 'ROUTINE DSCHG, HOME');
			});
			
		}
	});
}

getPatients();]]></CSP>
</Export>
