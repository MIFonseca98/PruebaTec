// grails-app/controllers/CitasMedicas/CitaController.groovy
package CitasMedicas

import java.time.LocalDateTime

class CitaController {

    def altaCita() {
        if (request.method == 'POST') {
            def cita = new Cita(params)

            if (validarReglasAltaCita(cita)) {
                cita.save()
                flash.message = "Cita agendada con éxito"
                redirect(action: 'altaCita')
            } else {
                flash.message = "Error al agendar la cita. Por favor, verifica las reglas de alta."
            }
        }
    }

    def validarReglasAltaCita(Cita cita) {
        // Regla: No se puede agendar cita en un mismo consultorio a la misma hora.
        def citasMismoConsultorioHora = Cita.findByConsultorioAndHorarioConsulta(cita.consultorio, cita.horarioConsulta)
        if (citasMismoConsultorioHora) {
            return false
        }

        // Regla: No se puede agendar cita para un mismo Dr. a la misma hora.
        def citasMismoDoctorHora = Cita.findByDoctorAndHorarioConsulta(cita.doctor, cita.horarioConsulta)
        if (citasMismoDoctorHora) {
            return false
        }

        // Regla: No se puede agendar cita para un paciente a la una misma hora ni con menos de 2 horas de diferencia para el mismo día.
        def horaMinimaPermitida = cita.horarioConsulta.minusHours(2)
        def citasMismoPacienteHora = Cita.findByNombrePacienteAndHorarioConsultaBetween(cita.nombrePaciente, horaMinimaPermitida, cita.horarioConsulta)
        if (citasMismoPacienteHora) {
            return false
        }

        // Regla: Un mismo doctor no puede tener más de 8 citas en el día.
        def citasDoctorEnElDia = Cita.countByDoctorAndHorarioConsultaBetween(cita.doctor, cita.horarioConsulta.withTime(0, 0, 0, 0), cita.horarioConsulta.withTime(23, 59, 59, 999))
        if (citasDoctorEnElDia >= 8) {
            return false
        }

        return true
    }
    
     def listarCitas() {
        [citas: Cita.list()]
    }

    def editarCita(Long id) {
        def cita = Cita.get(id)
        if (request.method == 'POST') {
            cita.properties = params

            if (validarReglasAltaCita(cita)) {
                cita.save()
                flash.message = "Cita editada con éxito"
                redirect(action: 'listarCitas')
            } else {
                flash.message = "Error al editar la cita. Por favor, verifica las reglas de alta."
            }
        }

        [cita: cita]
    }

    def consultarCitas() {
        if (request.method == 'GET') {
            def paramsConsulta = params.findAll { key, value -> value && value.trim() }

            // Validar que la fecha ingresada sea válida
            if (paramsConsulta.fecha && !paramsConsulta.fecha.matches("\\d{4}-\\d{2}-\\d{2}")) {
                flash.message = "Fecha no válida. Utiliza el formato 'yyyy-MM-dd'."
                return [citas: []]
            }

            // Convertir la fecha a LocalDateTime si está presente
            paramsConsulta.fecha = paramsConsulta.fecha ? LocalDateTime.parse(paramsConsulta.fecha + "T00:00:00") : null

            // Filtrar citas según las reglas de consulta
            def citasFiltradas = Cita.findAll(paramsConsulta).findAll { cita ->
                // Regla: Puedes consultar por fecha, consultorio y por Dr.
                return !(paramsConsulta.fecha && paramsConsulta.fecha != cita.horarioConsulta.withTime(0, 0, 0, 0))
                    || !(paramsConsulta.consultorio?.id && paramsConsulta.consultorio?.id != cita.consultorio?.id)
                    || !(paramsConsulta.doctor?.id && paramsConsulta.doctor?.id != cita.doctor?.id)
            }

            [citas: citasFiltradas]
        } else {
            [citas: []]
        }
    }
}
