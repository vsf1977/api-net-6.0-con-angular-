import { Component } from '@angular/core';
import { NavbarComponent } from "./components/navbar/navbar.component";
import { TarjetaComponent } from "./components/tarjeta/tarjeta.component";



@Component({
  selector: 'app-root',
  imports: [NavbarComponent, TarjetaComponent],
  templateUrl: './app.component.html',
  styleUrl: './app.component.css'
})
export class AppComponent {
  title = 'frontend';
}
