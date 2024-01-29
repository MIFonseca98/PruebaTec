<!-- grails-app/views/cita/editarCita.gsp -->

<!DOCTYPE html>
<html>
<head>
    <title>Editar Cita</title>
</head>
<body>
    <h1>Editar Cita</h1>
    <g:form action="${g.createLink(controller: 'cita', action: 'editarCita', params: [id: cita.id])}" method="post">
        <label>Doctor:</label>
        <g:select name="doctor.id" from="${Doctor.list()}" optionKey="id" optionValue="nombre" value="${cita?.doctor?.id}" required="true" />

        <label>Consultorio:</label>
        <g:select name="consultorio.id" from="${Consultorio.list()}" optionKey="id" optionValue="numero" value="${cita?.consultorio?.id}" required="true" />

        <label>Horario de consulta:</label>
        <g:dateTimePicker name="horarioConsulta" value="${cita?.horarioConsulta}" required="true" />

        <label>Nombre del paciente:</label>
        <g:textField name="nombrePaciente" value="${cita?.nombrePaciente}" required="true" />

        <button type="submit">Guardar Cambios</button>
    </g:form>
</body>
</html>
