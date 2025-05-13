import { Component, OnInit } from '@angular/core';
import { DataService } from '../../services/data.service';


@Component({
  selector: 'app-info',
  standalone: false,
  templateUrl: './info.component.html',
  styleUrl: './info.component.scss'
})
export class InfoComponent implements OnInit {
  metodo : string ="";
  gridInstance : any;
  items: any[] = [];
  avionList: any[] = [];
  ciudadList: any[] = [];
  ruta : string = '';
  constructor(public dataService: DataService) {
    this.dataService.getAll("avion").subscribe((data) =>  {
      this.avionList = data;      
    })
    this.dataService.getAll("ciudad").subscribe((data) =>  {
      this.ciudadList = data;      
    })   
    console.log(this.ciudadList)
    console.log(this.avionList)
  }

  ngOnInit(): void {    
    this.dataService.recibir.subscribe((ruta) =>{
      this.items = [];      
      this.ruta = ruta;           
      this.cargar(ruta);
    })
  }

  cargar(ruta : string){    
    this.dataService.getAll(ruta).subscribe((res) =>  {
      this.items = res;   
      console.log(this.items)  
      if (!res.length) 
        alert('No hay registros para mostrar');     
    });
  } 

  onDelete(e: any){
    console.log(e.data.id);
    this.dataService.delete(this.ruta,e.data.id).subscribe((res) =>  {
      this.cargar(this.ruta);
      if(res != 1)
      {
        alert("Ocurrio un error al borrar el registro");
      }
      else
        alert("Registro borrado");      
    });
  }  

  edit(data: any){
    this.dataService.edit(this.ruta,data).subscribe((res) =>  {
      if(res != 1){
        alert("Ocurrio un error al editar el registro");
      }
      else
        alert("Registro editado");
      this.gridInstance.refresh();
    });
  }  

  create(data: any){
    this.dataService.create(this.ruta,data).subscribe((res) =>  {
      if(res != 1)
        alert("Ocurrio un error al insertar el registro");
      else
        alert("Registro insertado");
      this.gridInstance.refresh();
    });
  }  
    
  onRowInserted(){
    this.metodo = "insertar";
  }

  onEditorPrepared(){
    this.metodo = "editar";
  }

  onSaved(e: any){
    if (this.metodo == "insertar")
    {
      if (this.isDataOk(e.changes[0].data))
        this.create(JSON.stringify(e.changes[0].data))
    }
    else{
      if (e.changes.length)
        this.edit(JSON.stringify(e.changes[0].data))
    }    
    console.log(e.component.refresh())
    this.gridInstance = e.component; 
  }

  isDataOk(data : any){
    if (data.id_ciudad_salida == undefined || data.id_ciudad_llegada == undefined || data.id_avion == undefined)
      return false
    else
      return true
  }

}