<!-- grails-app/views/cita/consultarCitas.gsp -->

<!DOCTYPE html>
<html>
<head>
    <title>Consultar Citas</title>
</head>
<body>
    <h1>Consultar Citas</h1>
    <g:form action="${g.createLink(controller: 'cita', action: 'consultarCitas')}" method="get">
        <label>Fecha:</label>
        <g:datePicker name="fecha" required="true" />

        <label>Consultorio:</label>
        <g:select name="consultorio.id" from="${Consultorio.list()}" optionKey="id" optionValue="numero" />

        <label>Doctor:</label>
        <g:select name="doctor.id" from="${Doctor.list()}" optionKey="id" optionValue="nombre" />

        <button type="submit">Consultar</button>
    </g:form>

    <h2>Resultados:</h2>
    <ul>
        <g:each var="cita" in="${citas}">
            <li>${cita.doctor.nombre} - ${cita.consultorio.numero} - ${cita.horarioConsulta} - ${cita.nombrePaciente}</li>
        </g:each>
    </ul>
</body>
</html>
