USE [BASE02]
GO
/****** Object:  StoredProcedure [dbo].[sp_consultaRevisaoManututencao]    Script Date: 16/07/2019 16:49:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER Procedure [dbo].[sp_consultaRevisaoManututencao] (@docproj_codigo as varchar(20)) 
AS
BEGIN

Declare @IdDocProj as uniqueidentifier
Declare @IdRevdoc as uniqueidentifier
Declare @CodMotRevisao as Varchar(3)


	SET @IdDocProj=(select docproj_id from docproj_documentosprojeto where docproj_codigo = @docproj_codigo and _delete = 0)

	select docproj_codigo, proj.proj_cofre, revdoc_auditoria, revdoc_motivorevisao, revdoc_motivoretrabalho, revdoc_complexidade,
	 revdoc_respretrabalho, revdoc_revisaoepc,
 
	* from revdoc_documento rev
	inner join docproj_documentosprojeto doc on (rev.docproj_id = doc.docproj_id)
	inner join proj_projeto proj on (proj.proj_codigo = left(docproj_codigo,7))
	where doc.docproj_id = @IdDocProj and rev._delete = 0

			 
END