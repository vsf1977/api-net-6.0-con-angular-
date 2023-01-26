import { Component, OnInit} from '@angular/core';
import { DataService } from 'src/app/services/data.service';

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
