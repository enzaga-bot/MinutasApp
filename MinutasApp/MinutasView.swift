import SwiftUI

struct MinutasView: View {
    
    // Función de cierre de sesión
    let onLogout: () -> Void
    
    // ViewModel de minutas
    @StateObject private var viewModel = MinutasViewModel()
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading, spacing: 16) {
                
                HStack {
                    Text("Minutas y Órdenes del día")
                        .font(.title2)
                        .fontWeight(.semibold)
                    
                    Spacer()
                    
                    Button(action: onLogout) {
                        Text("Cerrar Sesión")
                    }
                    .font(.footnote)
                }
                .padding(.top, 16)
                
                // Botón Nueva Minuta -> formulario
                NavigationLink(
                    destination: NuevaMinutaView(onGuardar: { nuevaMinuta in
                        viewModel.agregar(minuta: nuevaMinuta)
                    })
                ) {
                    HStack {
                        Image(systemName: "plus.circle.fill")
                        Text("Nueva Minuta")
                    }
                }
                .padding(.bottom, 8)
                
// Lista de Minutas
                // Contenido según el estado de carga
                if case .loading = viewModel.state {
                    // Estado: cargando
                    VStack {
                        Spacer()
                        ProgressView("Cargando minutas...")
                            .progressViewStyle(.circular)
                        Spacer()
                    }
                } else if case .error(let message) = viewModel.state {
                    // Estado: error
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Ocurrió un problema al cargar las minutas.")
                            .font(.headline)
                        
                        Text(message)
                            .font(.footnote)
                            .foregroundColor(.secondary)
                        
                        Button("Reintentar") {
                            viewModel.cargarMinutasDesdeJSON()
                        }
                        .padding(.top, 8)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                } else {
                    // Estado: success / idle con datos
                    List(viewModel.minutas, id: \.titulo) { minuta in
                        NavigationLink(
                            destination: MinutaDetailView(minuta: minuta)
                        ) {
                            Text(minuta.titulo)
                        }
                    }
                }
                
                
                
                
            }
            .padding(.horizontal, 16)
            .onAppear {
                viewModel.cargarMinutasDesdeJSON()
            }
        }
    }
}

#Preview {
    MinutasView(onLogout: {})
}
