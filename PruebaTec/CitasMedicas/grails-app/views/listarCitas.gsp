<!-- grails-app/views/cita/listarCitas.gsp -->

<!DOCTYPE html>
<html>
<head>
    <title>Listar Citas</title>
</head>
<body>
    <h1>Listar Citas</h1>
    <ul>
        <g:each var="cita" in="${Cita.list()}">
            <li>
                ${cita.doctor.nombre} - ${cita.consultorio.numero} - ${cita.horarioConsulta} - ${cita.nombrePaciente}
                <g:link action="editarCita" params="[id: cita.id]">Editar</g:link>
                <g:form action="${g.createLink(controller: 'cita', action: 'cancelarCita', params: [id: cita.id])}">
                    <button type="submit">Cancelar</button>
                </g:form>
            </li>
        </g:each>
    </ul>
</body>
</html>
