package exam.bean;

import lombok.*;

@Data
@AllArgsConstructor
@NoArgsConstructor
@RequiredArgsConstructor
public class DataDTO {
	//bean, jsp 태그 name, 오라클 컬럼명은 항상 같아야함
	
	@NonNull private int x;
	private int y;
	
}
	