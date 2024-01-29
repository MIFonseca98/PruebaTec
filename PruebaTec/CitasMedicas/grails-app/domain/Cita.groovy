// grails-app/domain/CitasMedicas/Cita.groovy
package CitasMedicas

import java.time.LocalDateTime

class Cita {
    Consultorio consultorio
    Doctor doctor
    LocalDateTime horarioConsulta
    String nombrePaciente

    static constraints = {
        horarioConsulta(blank: false)
        nombrePaciente(blank: false)
    }
}
