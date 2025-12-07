import SwiftUI

struct MinutasView: View {
    
    // Función de cierre de sesión
    let onLogout: () -> Void
    
    // ViewModel de minutas
    @StateObject private var viewModel = MinutasViewModel()
    
    var body: some View {
        NavigationView {
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
                List(viewModel.minutas, id: \.titulo) { minuta in
                    NavigationLink(
                        destination: MinutaDetailView(minuta: minuta)
                    ) {
                        Text(minuta.titulo)
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
