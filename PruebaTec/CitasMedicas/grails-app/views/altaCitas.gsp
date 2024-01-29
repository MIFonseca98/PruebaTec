<!-- grails-app/views/cita/altaCita.gsp -->

<!DOCTYPE html>
<html>
<head>
    <title>Alta de Cita</title>
</head>
<body>
    <h1>Alta de Cita</h1>
    <g:if test="${flash.message}">
        <div style="color: red;">${flash.message}</div>
    </g:if>
    <g:form action="${g.createLink(controller: 'cita', action: 'altaCita')}" method="post">
        <label>Doctor:</label>
        <g:select name="doctor.id" from="${Doctor.list()}" optionKey="id" optionValue="nombre" required="true" />

        <label>Consultorio:</label>
        <g:select name="consultorio.id" from="${Consultorio.list()}" optionKey="id" optionValue="numero" required="true" />

        <label>Horario de consulta:</label>
        <g:dateTimePicker name="horarioConsulta" required="true" />

        <label>Nombre del paciente:</label>
        <g:textField name="nombrePaciente" required="true" />

        <button type="submit">Guardar</button>
    </g:form>
</body>
</html>
