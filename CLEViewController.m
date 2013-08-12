//
//  CLEViewController.m
//  CatalogoListaEmpresas
//
//  Created by Pedro Farias Barbosa on 03/08/13.
//  Copyright (c) 2013 Pedro Farias Barbosa. All rights reserved.
//

#import "CLEViewController.h"
#import "CLEEmpresa.h"

@interface CLEViewController ()

@end

@implementation CLEViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self loadEmpresas];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView
    numberOfRowsInSection:(NSInteger)section {
    return listaEmpresas.count;
}

-(void) loadEmpresas{
    NSString *plistCaminho = [[NSBundle mainBundle]
                              pathForResource:@"empresas" ofType:@"plist"];
    NSDictionary * pl =[NSDictionary dictionaryWithContentsOfFile:plistCaminho];
    NSArray *dados = [pl objectForKey:@"empresas"];
    listaEmpresas = [[NSMutableArray alloc]init];
    
    for(NSDictionary *item in dados){
        NSString *nome = [item objectForKey:@"nome"];
        NSString *quantidadeFuncionarios = [item objectForKey:@"quantidadeFuncionarios"];
        
        CLEEmpresa *e = [[CLEEmpresa alloc] initWithName:nome
                                      andQuantidade:quantidadeFuncionarios];
        [listaEmpresas addObject:e];
        [e release];
    }
}

-(UITableViewCell *) tableView:(UITableView *)tableView
       cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *CelulaEmpresaCacheID = @"CelulaEmpresaCacheID";
    UITableViewCell *cell = [self.tabelaEmpresas
                           dequeueReusableCellWithIdentifier:CelulaEmpresaCacheID];
    if(!cell){
        cell = [[[UITableViewCell alloc]
                initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CelulaEmpresaCacheID] autorelease];
        CLEEmpresa *empresa = [listaEmpresas objectAtIndex:indexPath.row];
        cell.textLabel.text = empresa.nome;
    }
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    CLEEmpresa *empresa = [listaEmpresas objectAtIndex:indexPath.row];
    
    NSString *msg = [NSString stringWithFormat:@"Empresa: %@\nQuantidade de Empregados: %@",empresa.nome,empresa.quantidadeFuncionarios];
    
    UIAlertView *alert = [[[UIAlertView alloc]initWithTitle:@"Empresa" message:msg delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil]autorelease];
    
    [alert show];
    
    [self.tabelaEmpresas deselectRowAtIndexPath:indexPath animated:YES];
    
}

- (void)dealloc {
    [_tabelaEmpresas release];
    [_btnEditar release];
    [super dealloc];
}

-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    [listaEmpresas removeObjectAtIndex:indexPath.row];
    [self.tabelaEmpresas reloadData];
}

-(NSString*)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return @"Remover";
}

- (IBAction)btnEditar:(id)sender {
    
    if([self.btnEditar.title isEqualToString:@"Editar"])
    {
        [self.tabelaEmpresas setEditing:YES animated:YES];
        self.btnEditar.title = @"Pronto";
    }
    else
    {
        [self.tabelaEmpresas setEditing:NO animated:YES];
        self.btnEditar.title = @"Editar";
    }
}

-(UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return UITableViewCellEditingStyleDelete;
}

@end
