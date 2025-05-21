import { Component, EventEmitter, OnInit} from '@angular/core';
import { DataService } from '../../services/data.service';
import { Router } from '@angular/router';
import { NgFor, TitleCasePipe } from '@angular/common'

@Component({
  selector: 'app-navbar',
  imports: [NgFor, TitleCasePipe],
  templateUrl: './navbar.component.html',
  styleUrls: ['./navbar.component.scss']
})
export class NavbarComponent implements OnInit {

  constructor(public dataService: DataService, private _router: Router) { }

  rutas : string[] = ["avion", "ciudad","vuelo", "fabricante"] 
  
  ngOnInit(): void {
  }

  routing(e : Event){
    const ruta = (e.target as HTMLInputElement).id
    this.dataService.enviar(ruta);
    const menu = document.getElementById("menu")?.childNodes;    
    menu?.forEach(item =>
      { const enlace = item.firstChild;
        (enlace as HTMLInputElement).classList.remove("actual");
        (enlace as HTMLInputElement).classList.add("normal");
        if ((enlace as HTMLInputElement).id == ruta){
          (enlace as HTMLInputElement).classList.add("actual");
          (enlace as HTMLInputElement).classList.remove("normal");   
        }
    });
  }
}