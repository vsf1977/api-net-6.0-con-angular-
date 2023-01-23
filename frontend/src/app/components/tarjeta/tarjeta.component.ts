import { Component, OnInit } from '@angular/core';
import { DataService } from 'src/app/services/data.service';
@Component({
  selector: 'app-tarjeta',
  templateUrl: './tarjeta.component.html',
  styleUrls: ['./tarjeta.component.css']
})
export class TarjetaComponent implements OnInit {

  items: any[] = [];
  ruta : string ='';
  constructor(public dataService: DataService) { }

  cargar(ruta : string){
    this.dataService.getAll(ruta).subscribe((data) =>  {
      if (data)      {
        console.log(data)
        this.items = data;
      } else {
        alert('No hay paises para mostrar');
      }
    });
  }

  ngOnInit(): void {    
    this.dataService.recibir.subscribe((data) =>{
      this.items = [];
      this.ruta = data;
      this.cargar(data);
    })
  }

  borrar(id : any){
    this.dataService.delete(this.ruta,id).subscribe((data) =>  {
        this.cargar(this.ruta);
    });
  }

}
