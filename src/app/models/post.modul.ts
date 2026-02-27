import { Usuario } from "./user.model";

export interface Post {
    id: number;
    content: string;
    user: Usuario;
}
