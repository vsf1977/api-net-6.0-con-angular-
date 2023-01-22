import { Component, EventEmitter, Input, OnInit, Output } from '@angular/core';
import { DataService } from 'src/app/services/data.service';
import { TarjetaComponent } from '../tarjeta/tarjeta.component';

@Component({
  selector: 'app-navbar',
  templateUrl: './navbar.component.html',
  styleUrls: ['./navbar.component.css']
})
export class NavbarComponent implements OnInit {

  constructor(public dataService: DataService) { }

  ngOnInit(): void {
  }

  routing(e : Event){
    this.dataService.enviar((e.target as HTMLInputElement).id);
  }

}
